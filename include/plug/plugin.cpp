
#include <ankerl/unordered_dense.h>
#include <fmt/format.h>

#include <clang/AST/RecursiveASTVisitor.h>
#include <clang/Frontend/FrontendPluginRegistry.h>

#include "colors.h"

#include <span>

namespace plug {
using ankerl::unordered_dense::map;
using ankerl::unordered_dense::set;

using namespace clang;
using llvm::StringRef;
using Loc = SourceLocation;

using std::span;

template <class T> using view = std::span<T const>;

class method_visitor : public RecursiveASTVisitor<method_visitor> {
  public:
    CompilerInstance& compiler;
    ASTContext&       ctx = compiler.getASTContext();
    PrintingPolicy    pol = ctx.getPrintingPolicy();

    set<CXXMethodDecl*> methods;

    method_visitor(CompilerInstance& CI) : compiler(CI) {}

    bool VisitCXXMethodDecl(CXXMethodDecl* method) {
        methods.insert(method);
        return true;
    }

    void rewrite_methods() {
        for (auto m : methods) {
            rewrite_method(*m);
        }
    }

    /// Allocate space for the given elements within the ctx, copy the elements
    /// into the allocated space, and then return an ArrayRef to those elements
    template <class T> ArrayRef<T> array_ref(view<T> elems) {
        size_t count    = elems.size();
        T*     dest     = ctx.Allocate<T>(elems.size());
        T*     refBegin = dest;
        T*     refEnd   = dest + count;

        for (auto const& value : elems) {
            *dest = value;
            ++dest;
        }
        return ArrayRef<T>(refBegin, refEnd);
    }

    /// Allocate space for the given elements within the ctx, copy the elements
    /// into the allocated space, and then return an ArrayRef to those elements
    template <class T> ArrayRef<T> array_ref(std::initializer_list<T> elems) {
        return array_ref(view<T>(elems.begin(), elems.size()));
    }

    auto string(Loc loc) -> std::string {
        return ctx.getFullLoc(loc).printToString(ctx.getSourceManager());
    }

    void skip_message(CXXMethodDecl& m, std::string_view why) {
        llvm::outs() << fmt::format("\n" COLOR_GRAY "Skipping decl.\n"
                                    "    name        = {}\n"
                                    "    return_type = {}\n"
                                    "    loc         = {}\n"
                                    "    why:        = {}\n" COLOR_RE,
                                    m.getQualifiedNameAsString(),
                                    m.getReturnType().getAsString(pol),
                                    string(m.getLocation()),
                                    why);
    }

    void rewrite_message(CXXMethodDecl& m) {
        llvm::outs() << fmt::format("\n"
                                    "Rewriting decl.\n"
                                    "    name        = " COLOR_BC "{}" COLOR_RE "\n"
                                    "    return_type = " COLOR_BY "{}" COLOR_RE "\n"
                                    "    loc         = " COLOR_BG "{}" COLOR_RE "\n",
                                    m.getQualifiedNameAsString(),
                                    m.getReturnType().getAsString(pol),
                                    string(m.getLocation()));
    }


    auto string_literal(Loc loc, StringRef s) -> StringLiteral* {
        // Note: in instances I've seen in the clang codebase, StringLiteral::Create() is perfectly fine
        // accepting a std::string (allocated on the stack). This implies to me that `StringLiteral::Create`
        // makes a copy of the input string.
        return StringLiteral::Create(ctx,
                                     s,
                                     StringLiteralKind::Ordinary,
                                     false,
                                     ctx.getStringLiteralArrayType(ctx.CharTy, s.size()),
                                     loc);
    }

    auto decay_to_ptr(Expr* expr) {
        return ImplicitCastExpr::Create(ctx,
                                        ctx.getArrayDecayedType(expr->getType()),
                                        CastKind::CK_ArrayToPointerDecay,
                                        expr,
                                        nullptr,
                                        VK_PRValue,
                                        FPOptionsOverride());
    }

    void rewrite_method(CXXMethodDecl& m) {
        auto ty            = m.getReturnType();
        auto const_char_ty = ctx.getPointerType(ctx.getConstType(ctx.CharTy));

        if (ty != const_char_ty) {
            return skip_message(m, "Return type must be const char*");
        }

        if (!m.doesThisDeclarationHaveABody()) {
            return skip_message(m, "The declaration must have a body in order to rewrite it");
        }

        if (m.isTemplated() && !m.isTemplateInstantiation()) {
            return skip_message(m,
                                "It only makes sense to rewrite instantiations, not raw templates");
        }

        auto loc = m.getBodyRBrace();

        auto msg = string_literal(
            loc,
            fmt::format("Successfully rewrote {} @ {}", m.getNameAsString(), string(loc)));


        m.setBody(                //
            CompoundStmt::Create( //
                ctx,
                array_ref<Stmt*>({
                    ReturnStmt::Create(ctx, loc, decay_to_ptr(msg), nullptr),
                }),
                FPOptionsOverride(),
                loc,
                loc));


        rewrite_message(m);
        fmt::print("\n    ");
        m.print(llvm::outs(), 2, false);
    }

    /// We want to visit implicitly generated destructors in order to instrument
    /// them
    bool shouldVisitImplicitCode() const { return true; }

    /// We want to visit template instantiations, since we need to insert
    /// the hook into these
    bool shouldVisitTemplateInstantiations() const { return true; }
};

class ast_consumer : public ASTConsumer {
    CompilerInstance& compiler;

  public:
    ast_consumer(CompilerInstance& compiler) : compiler(compiler) {}

    void HandleTranslationUnit(ASTContext& ctx) override {
        method_visitor v(compiler);

        llvm::outs() << "Traversing Translation Unit Decl\n";
        v.TraverseDecl(ctx.getTranslationUnitDecl());
        v.rewrite_methods();
    }
};

class plugin_action : public PluginASTAction {
  protected:
    std::unique_ptr<ASTConsumer> CreateASTConsumer(CompilerInstance& CI, StringRef) override {
        return std::make_unique<ast_consumer>(CI);
    }

    bool ParseArgs(const CompilerInstance& CI, const std::vector<std::string>& args) override {
        DiagnosticsEngine& D = CI.getDiagnostics();
        for (auto const& arg : args) {
            unsigned DiagID = D.getCustomDiagID(DiagnosticsEngine::Error,
                                                "invalid argument '%0' - this plugin "
                                                "does not take any arguments");
            D.Report(DiagID) << arg;
        }

        return args.empty();
    }

    ActionType getActionType() override { return ActionType::AddBeforeMainAction; }

    void PrintHelp(llvm::raw_ostream& ros) {}
};
} // namespace plug

static clang::FrontendPluginRegistry::Add<plug::plugin_action> X(
    "test_rewrite",
    "Instrument destructors to save information about the current object, captured during "
    "profiling");
