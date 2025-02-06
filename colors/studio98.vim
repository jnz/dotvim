" Studio98 color scheme
" by Jan Zwiener, mail: jan@zwiener.org
"
" 2025/02/04: Version 1.0 Initial release
" :help group-name to test
"
"    #c43d21   Red
"    #f3b63c   Orange
"    #fff3a8   Yellow
"    #478C23   Green (Comment)
"    #0048ff   Blue
"    #000082   Dark Blue
"    #357ec7   Cornflower Blue
"    #545454   Very dark Gray
"    #b3b3b3   Gray
"    #dfdfdf   Light Gray
"    #f6f6f6   Very light Gray

set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "studio98"

hi! link Terminal Normal
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link StatuslineTerm Statusline
hi! link StatuslineTermNC StatuslineNC
hi! link MessageWindow Pmenu
hi! link PopupNotification Todo

hi EndOfBuffer guifg=#b3b3b3 guibg=#f6f6f6 gui=bold cterm=bold
hi ToolbarLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ToolbarButton guifg=NONE guibg=#bcbcbc gui=bold cterm=bold
hi SignColumn guifg=#00008b guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Directory guifg=#357ec7 guibg=NONE gui=bold cterm=bold
hi Conceal guifg=#b3b3b3 guibg=NONE gui=NONE cterm=NONE

" Taglist colors
hi MyTagListFileName guifg=black guibg=#357ec7
hi MyTagListTagName guifg=white guibg=#000082

if version >= 700
  hi CursorLine guifg=NONE guibg=#dfdfdf
  hi CursorLineNr guifg=black guibg=#f6f6f6 gui=bold cterm=bold
  hi CursorColumn guibg=#f6f6f6
  hi MatchParen guifg=black guibg=#dfdfdf

  hi TabLine guifg=black guibg=#b3b3b3
  hi TabLineFill guifg=#b3b3b3
  hi TabLineSel guifg=black guibg=#f6f6f6 gui=bold

  hi Pmenu guifg=black guibg=#f6f6f6
  hi PmenuSel guifg=white guibg=#000082
  hi PmenuSbar guifg=NONE guibg=#dfdfdf gui=NONE
  hi PmenuThumb guifg=NONE guibg=black gui=NONE
  hi PmenuMatchSel guifg=#b3b3b3 guibg=#000082 gui=NONE
  hi PmenuMatch guifg=#545454 guibg=#f6f6f6 gui=NONE
endif

hi Title guifg=black
hi Underlined guifg=black gui=underline

hi Normal guifg=black guibg=white
hi ModeMsg guifg=black guibg=white
hi Cursor guibg=black
hi lCursor guifg=#dfdfdf guibg=#c43d21 gui=NONE cterm=NONE
hi LineNr guifg=#b3b3b3 guibg=#f6f6f6
hi Visual guifg=white guibg=#000082
hi VisualNOS guifg=NONE guibg=#545454 gui=NONE cterm=NONE
hi WildMenu guifg=white guibg=#000082
hi IncSearch guibg=white guifg=#000082
hi Question guifg=white guibg=#000082

hi StatusLine guifg=white guibg=#357ec7 gui=bold
hi StatusLineNC guifg=#dfdfdf guibg=white
hi VertSplit guifg=#b3b3b3 guibg=#b3b3b3
hi QuickFixLine guifg=white guibg=#000082 gui=NONE

hi NonText guifg=#b3b3b3 guibg=#f6f6f6
hi Comment guifg=#478C23
hi Folded guifg=#708090 guibg=#357ec7
hi FoldColumn guifg=#708090 guibg=#357ec7

hi Constant guifg=#000082
hi Number guifg=black
hi Float guifg=black
hi Boolean guifg=#000082
hi String guifg=#000082

hi Statement guifg=#0048ff
hi Type guifg=#0048ff
hi Structure guifg=#0048ff
hi Identifier guifg=#0048ff
hi Function guifg=#0048ff
hi Repeat guifg=#0048ff gui=bold
hi Conditional guifg=#0048ff gui=bold
hi Operator guifg=#0048ff

hi PreProc guifg=#0048ff
hi Define guifg=#0048ff
hi Include guifg=#0048ff

hi Error guifg=#c43d21 guibg=white gui=bold,underline
hi Todo guifg=white guibg=#000082 gui=bold
hi SpecialKey guifg=#000082 guibg=#f6f6f6
hi Special guifg=black guibg=white

" Diff
hi DiffChange guibg=#f3b63c gui=bold
hi DiffText guibg=#f0c8c8 gui=bold
hi DiffAdd guibg=#c0e0d0 gui=bold
hi DiffDelete guibg=#f0e0b0 gui=bold

" Other
hi ColorColumn guifg=black guibg=#f6f6f6
hi ErrorMsg guifg=#c43d21 guibg=white
hi MoreMsg guifg=#0048ff
hi Search guibg=#fff3a8 guifg=black
hi CurSearch guibg=#f3b63c guifg=black
hi SpellBad guifg=#c43d21 gui=underline
hi SpellCap guifg=#0048ff gui=underline
hi SpellLocal guifg=#478C23 gui=underline
hi SpellRare guifg=#800080 gui=underline
hi WarningMsg guifg=#c43d21
