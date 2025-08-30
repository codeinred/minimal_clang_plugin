; ModuleID = 'test_inputs/hello.cpp'
source_filename = "test_inputs/hello.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.MyClass = type { i8 }

@.str = private unnamed_addr constant [9 x i8] c"method_3\00", align 1, !dbg !0
@__const.main.m = private unnamed_addr constant %struct.MyClass undef, align 1
@.str.1 = private unnamed_addr constant [59 x i8] c"Successfully rewrote method_1 @ test_inputs/hello.cpp:3:56\00", align 1, !dbg !8
@.str.2 = private unnamed_addr constant [59 x i8] c"Successfully rewrote method_2 @ test_inputs/hello.cpp:8:54\00", align 1, !dbg !13

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define noundef ptr @_ZN7MyClass8method_3Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #0 !dbg !25 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !36, !DIExpression(), !38)
  %3 = load ptr, ptr %2, align 8
  ret ptr @.str, !dbg !39
}

; Function Attrs: mustprogress noinline norecurse optnone ssp uwtable(sync)
define noundef i32 @main() #1 !dbg !40 {
  %1 = alloca %struct.MyClass, align 1
    #dbg_declare(ptr %1, !44, !DIExpression(), !45)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %1, ptr align 1 @__const.main.m, i64 1, i1 false), !dbg !45
  %2 = call noundef ptr @_ZN7MyClass8method_1Ev(ptr noundef nonnull align 1 dereferenceable(1) %1), !dbg !46
  %3 = call i32 @puts(ptr noundef %2), !dbg !47
  %4 = call noundef ptr @_ZN7MyClass8method_2Ev(ptr noundef nonnull align 1 dereferenceable(1) %1), !dbg !48
  %5 = call i32 @puts(ptr noundef %4), !dbg !49
  %6 = call noundef ptr @_ZN7MyClass8method_3Ev(ptr noundef nonnull align 1 dereferenceable(1) %1), !dbg !50
  %7 = call i32 @puts(ptr noundef %6), !dbg !51
  ret i32 0, !dbg !52
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @puts(ptr noundef) #3

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7MyClass8method_1Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #0 !dbg !53 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !54, !DIExpression(), !55)
  %3 = load ptr, ptr %2, align 8
  ret ptr @.str.1, !dbg !56
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7MyClass8method_2Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #0 !dbg !57 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !58, !DIExpression(), !59)
  %3 = load ptr, ptr %2, align 8
  ret ptr @.str.2, !dbg !60
}

attributes #0 = { mustprogress noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress noinline norecurse optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!15, !16, !17, !18, !19, !20, !21}
!llvm.dbg.cu = !{!22}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 10, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "test_inputs/hello.cpp", directory: "/opt/pages/minimal_clang_plugin", checksumkind: CSK_MD5, checksum: "6eccf929734ed357d1c8ad613278a432")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 9)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 3, type: !10, isLocal: true, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 472, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 59)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(scope: null, file: !2, line: 8, type: !10, isLocal: true, isDefinition: true)
!15 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 5]}
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 8, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 1}
!22 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !2, producer: "Homebrew clang version 20.1.7", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !23, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!23 = !{!0, !8, !13}
!24 = !{!"Homebrew clang version 20.1.7"}
!25 = distinct !DISubprogram(name: "method_3", linkageName: "_ZN7MyClass8method_3Ev", scope: !26, file: !2, line: 10, type: !29, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !22, declaration: !34, retainedNodes: !35)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MyClass", file: !2, line: 2, size: 8, flags: DIFlagTypePassByValue, elements: !27, identifier: "_ZTS7MyClass")
!27 = !{!28, !33, !34}
!28 = !DISubprogram(name: "method_1", linkageName: "_ZN7MyClass8method_1Ev", scope: !26, file: !2, line: 3, type: !29, scopeLine: 3, flags: DIFlagPrototyped, spFlags: 0)
!29 = !DISubroutineType(types: !30)
!30 = !{!31, !32}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!33 = !DISubprogram(name: "method_2", linkageName: "_ZN7MyClass8method_2Ev", scope: !26, file: !2, line: 4, type: !29, scopeLine: 4, flags: DIFlagPrototyped, spFlags: 0)
!34 = !DISubprogram(name: "method_3", linkageName: "_ZN7MyClass8method_3Ev", scope: !26, file: !2, line: 5, type: !29, scopeLine: 5, flags: DIFlagPrototyped, spFlags: 0)
!35 = !{}
!36 = !DILocalVariable(name: "this", arg: 1, scope: !25, type: !37, flags: DIFlagArtificial | DIFlagObjectPointer)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!38 = !DILocation(line: 0, scope: !25)
!39 = !DILocation(line: 10, column: 35, scope: !25)
!40 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 16, type: !41, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !22, retainedNodes: !35)
!41 = !DISubroutineType(types: !42)
!42 = !{!43}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DILocalVariable(name: "m", scope: !40, file: !2, line: 17, type: !26)
!45 = !DILocation(line: 17, column: 13, scope: !40)
!46 = !DILocation(line: 18, column: 12, scope: !40)
!47 = !DILocation(line: 18, column: 5, scope: !40)
!48 = !DILocation(line: 19, column: 12, scope: !40)
!49 = !DILocation(line: 19, column: 5, scope: !40)
!50 = !DILocation(line: 20, column: 12, scope: !40)
!51 = !DILocation(line: 20, column: 5, scope: !40)
!52 = !DILocation(line: 21, column: 1, scope: !40)
!53 = distinct !DISubprogram(name: "method_1", linkageName: "_ZN7MyClass8method_1Ev", scope: !26, file: !2, line: 3, type: !29, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !22, declaration: !28, retainedNodes: !35)
!54 = !DILocalVariable(name: "this", arg: 1, scope: !53, type: !37, flags: DIFlagArtificial | DIFlagObjectPointer)
!55 = !DILocation(line: 0, scope: !53)
!56 = !DILocation(line: 3, column: 56, scope: !53)
!57 = distinct !DISubprogram(name: "method_2", linkageName: "_ZN7MyClass8method_2Ev", scope: !26, file: !2, line: 8, type: !29, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !22, declaration: !33, retainedNodes: !35)
!58 = !DILocalVariable(name: "this", arg: 1, scope: !57, type: !37, flags: DIFlagArtificial | DIFlagObjectPointer)
!59 = !DILocation(line: 0, scope: !57)
!60 = !DILocation(line: 8, column: 54, scope: !57)
