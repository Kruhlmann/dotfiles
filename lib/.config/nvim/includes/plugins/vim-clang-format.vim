autocmd FileType c,cpp,objc,h,hpp ClangFormatAutoEnable
let g:clang_format#detect_style_file = 1
let g:clang_format#style_options = {
    \ "BasedOnStyle": "LLVM",
    \ "Language": "Cpp",
    \ "IndentWidth": 4,
    \ "ColumnLimit": 80,
    \ "AlignAfterOpenBracket": "Align",
    \ "BreakBeforeBraces": "Attach",
    \ "CompactNamespaces": "false",
    \ "FixNamespaceComments": "true",
    \ "JavaScriptQuotes": "Double",
    \ "KeepEmptyLinesAtTheStartOfBlocks": "true",
    \ "NamespaceIndentation": "None",
    \ "ReflowComments": "true",
    \ "SortIncludes": "true",
    \ "SpaceAfterLogicalNot": "false",
    \ "SpaceBeforeAssignmentOperators": "true",
    \ "SpaceInEmptyParentheses": "false",
    \ "SpacesBeforeTrailingComments": 1,
    \ "Standard": "Auto",
    \ "UseTab": "Never"}
