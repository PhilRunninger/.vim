" Vim syntax file
" Language: VHT Log files
" Maintainer: Phil Runninger

if exists("b:current_syntax")
  finish
endif

let b:current_syntax="vht"

syn match vhMainOutput '^MainOutput| *\d\+'
syn match vhMainReport '^MainReport| *\d\+'
syn match vhIVROutput '^IVROutput| *\d\+'
syn match vhTIALOutput '^TIALOutput| *\d\+'

syn keyword vhError   ERROR
syn keyword vhWarning WARNING
syn keyword vhInfo    INFO
syn match   vhError   '\[error\]'
syn match   vhWarning '\[debug\]'
syn match   vhInfo    '\[info\]'

syn keyword vhtOTP    Application Supervisor

syn match   vhPid          '<\d\+\.\d\+\.\d\+>'
syn match   vhModFuncLine  '\([a-z]\w\{-}:\)\{2}\d\+'

syn keyword vhTIAL         TIALEvent
syn match   vhTIAL         'CTIAL\w\+::'

syn match   vhClasses      '\(CCall\|CMultiCallDevice\|CVHIVR\|CVHTCall\|CVHTCallState\|CVirtualHold\|CVirtualQueue\|Utilities\)::'
syn match   vhClassesOther '\w\+::'

syn match   vhDelimiter    '|'
syn match   vhTimeStamp    '\d\{4}\(-\d\d\)\{2} \d\d\(:\d\d\)\{2}\.\d\d\d'

syn match   vhCallId       '\<V\?[0-9A-F]\{31}'
syn match   vhThreadId     '\<[0-9a-f]\+$'
syn match   vhNumberString '['"]\d\{-}\.\?\d\{-}['"]'
syn match   vhString       '\(<<\)\?['"].\{-}['"]\(>>\)\?'
syn match   vhBinaryString '<<\(\d\+,\?\)\+>>'

hi def link vhMainOutput   Statement
hi def link vhMainReport   Special
hi def link vhIVROutput    Identifier
hi def link vhTIALOutput   Constant
hi def link vhError        WarningMsg
hi def link vhWarning      Question
hi def link vhInfo         Directory
hi def link vhClasses      Identifier
hi def link vhClassesOther Macro
hi def link vhTIAL         PreProc
hi def link vhDelimiter    NonText
hi def link vhTimeStamp    Type
hi def link vhCallId       Constant
hi def link vhThreadId     Character
hi def link vhNumberString Number
hi def link vhString       String
hi def link vhBinaryString Comment
hi def link vhPid          Macro
hi def link vhModFuncLine  Identifier
hi def link vhtOTP         Keyword
