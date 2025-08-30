; ModuleID = 'test_inputs/hello_noinline.cpp'
source_filename = "test_inputs/hello_noinline.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.MyClass = type { i8 }

@.str = private unnamed_addr constant [9 x i8] c"method_3\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [68 x i8] c"Successfully rewrote method_1 @ test_inputs/hello_noinline.cpp:3:74\00", align 1, !dbg !8
@.str.2 = private unnamed_addr constant [68 x i8] c"Successfully rewrote method_2 @ test_inputs/hello_noinline.cpp:8:54\00", align 1, !dbg !13

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind ssp willreturn memory(none) uwtable(sync)
define noundef nonnull ptr @_ZN7MyClass8method_3Ev(ptr nocapture noundef nonnull readnone align 1 dereferenceable(1) %0) local_unnamed_addr #0 !dbg !25 {
    #dbg_value(ptr %0, !36, !DIExpression(), !38)
  ret ptr @.str, !dbg !39
}

; Function Attrs: mustprogress norecurse nounwind ssp uwtable(sync)
define noundef i32 @main() local_unnamed_addr #1 !dbg !40 {
  %1 = alloca %struct.MyClass, align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %1) #5, !dbg !46
    #dbg_declare(ptr %1, !45, !DIExpression(), !47)
  %2 = call noundef ptr @_ZN7MyClass8method_1Ev(ptr noundef nonnull align 1 dereferenceable(1) %1), !dbg !48
  %3 = call i32 @puts(ptr noundef nonnull dereferenceable(1) %2), !dbg !49
  %4 = call noundef ptr @_ZN7MyClass8method_2Ev(ptr noundef nonnull align 1 dereferenceable(1) %1), !dbg !50
  %5 = call i32 @puts(ptr noundef nonnull dereferenceable(1) %4), !dbg !51
  %6 = call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str), !dbg !52
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %1) #5, !dbg !53
  ret i32 0, !dbg !53
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nofree nounwind
declare !dbg !54 noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #3

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7MyClass8method_1Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #4 !dbg !57 {
    #dbg_value(ptr %0, !59, !DIExpression(), !60)
  ret ptr @.str.1, !dbg !61
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7MyClass8method_2Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #4 !dbg !62 {
    #dbg_value(ptr %0, !64, !DIExpression(), !65)
  ret ptr @.str.2, !dbg !66
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind ssp willreturn memory(none) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress norecurse nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { nounwind }

!llvm.module.flags = !{!15, !16, !17, !18, !19, !20, !21}
!llvm.dbg.cu = !{!22}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 10, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "test_inputs/hello_noinline.cpp", directory: "/opt/pages/minimal_clang_plugin", checksumkind: CSK_MD5, checksum: "5c4625fceecb5a56e37562138f2e7433")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 9)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 3, type: !10, isLocal: true, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 544, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 68)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(scope: null, file: !2, line: 8, type: !10, isLocal: true, isDefinition: true)
!15 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 5]}
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 8, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 1}
!22 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !2, producer: "Homebrew clang version 20.1.7", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !23, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!23 = !{!0, !8, !13}
!24 = !{!"Homebrew clang version 20.1.7"}
!25 = distinct !DISubprogram(name: "method_3", linkageName: "_ZN7MyClass8method_3Ev", scope: !26, file: !2, line: 10, type: !29, scopeLine: 10, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !22, declaration: !34, retainedNodes: !35)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MyClass", file: !2, line: 2, size: 8, flags: DIFlagTypePassByValue, elements: !27, identifier: "_ZTS7MyClass")
!27 = !{!28, !33, !34}
!28 = !DISubprogram(name: "method_1", linkageName: "_ZN7MyClass8method_1Ev", scope: !26, file: !2, line: 3, type: !29, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!29 = !DISubroutineType(types: !30)
!30 = !{!31, !32}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!33 = !DISubprogram(name: "method_2", linkageName: "_ZN7MyClass8method_2Ev", scope: !26, file: !2, line: 4, type: !29, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!34 = !DISubprogram(name: "method_3", linkageName: "_ZN7MyClass8method_3Ev", scope: !26, file: !2, line: 5, type: !29, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!35 = !{!36}
!36 = !DILocalVariable(name: "this", arg: 1, scope: !25, type: !37, flags: DIFlagArtificial | DIFlagObjectPointer)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!38 = !DILocation(line: 0, scope: !25)
!39 = !DILocation(line: 10, column: 35, scope: !25)
!40 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 16, type: !41, scopeLine: 16, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !22, retainedNodes: !44)
!41 = !DISubroutineType(types: !42)
!42 = !{!43}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !{!45}
!45 = !DILocalVariable(name: "m", scope: !40, file: !2, line: 17, type: !26)
!46 = !DILocation(line: 17, column: 5, scope: !40)
!47 = !DILocation(line: 17, column: 13, scope: !40)
!48 = !DILocation(line: 18, column: 12, scope: !40)
!49 = !DILocation(line: 18, column: 5, scope: !40)
!50 = !DILocation(line: 19, column: 12, scope: !40)
!51 = !DILocation(line: 19, column: 5, scope: !40)
!52 = !DILocation(line: 20, column: 5, scope: !40)
!53 = !DILocation(line: 21, column: 1, scope: !40)
!54 = !DISubprogram(name: "puts", scope: !2, file: !2, line: 13, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!55 = !DISubroutineType(types: !56)
!56 = !{!43, !31}
!57 = distinct !DISubprogram(name: "method_1", linkageName: "_ZN7MyClass8method_1Ev", scope: !26, file: !2, line: 3, type: !29, scopeLine: 3, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !22, declaration: !28, retainedNodes: !58)
!58 = !{!59}
!59 = !DILocalVariable(name: "this", arg: 1, scope: !57, type: !37, flags: DIFlagArtificial | DIFlagObjectPointer)
!60 = !DILocation(line: 0, scope: !57)
!61 = !DILocation(line: 3, column: 74, scope: !57)
!62 = distinct !DISubprogram(name: "method_2", linkageName: "_ZN7MyClass8method_2Ev", scope: !26, file: !2, line: 8, type: !29, scopeLine: 8, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !22, declaration: !33, retainedNodes: !63)
!63 = !{!64}
!64 = !DILocalVariable(name: "this", arg: 1, scope: !62, type: !37, flags: DIFlagArtificial | DIFlagObjectPointer)
!65 = !DILocation(line: 0, scope: !62)
!66 = !DILocation(line: 8, column: 54, scope: !62)
