" Studio98 color scheme
" by Jan Zwiener, mail: jan@zwiener.org
"
" 2025/01/30: Version 1.0 Initial release
" :help group-name to test

set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "studio98"

" Taglist colors
hi MyTagListFileName guifg=black guibg=#c0d0e0 ctermfg=0 ctermbg=251
hi MyTagListTagName guifg=white guibg=#000082 ctermfg=0 ctermbg=214

if version >= 700
  hi CursorLine guifg=white guibg=#545454 ctermfg=255 ctermbg=27
  hi CursorColumn guibg=#f6f6f6 ctermbg=255
  hi MatchParen guifg=black guibg=#dfdfdf ctermfg=0 ctermbg=252

  hi TabLine guifg=black guibg=#c0c0c0 ctermfg=0 ctermbg=252
  hi TabLineFill guifg=#b3b3b3 ctermfg=246
  hi TabLineSel guifg=black guibg=#f0f0f0 gui=bold ctermfg=0 ctermbg=255 cterm=bold

  hi Pmenu guifg=white guibg=#808080 ctermfg=15 ctermbg=8
  hi PmenuSel guifg=white guibg=#000082 ctermfg=0 ctermbg=214
endif

hi Title guifg=#202020 ctermfg=233
hi Underlined guifg=#202020 gui=underline ctermfg=233 cterm=underline

hi Normal guifg=black guibg=white ctermfg=0 ctermbg=15
hi ModeMsg guifg=black guibg=white ctermfg=0 ctermbg=15
hi Cursor guibg=#545454 ctermbg=234
hi LineNr guifg=#b3b3b3 guibg=#ededed ctermfg=15 ctermbg=251
hi Visual guifg=white guibg=#5381bc ctermfg=15 ctermbg=25
hi WildMenu guifg=white guibg=#000082 ctermfg=0 ctermbg=27
hi IncSearch guibg=white guifg=#000082 ctermfg=0 ctermbg=27
hi Question guifg=white guibg=#000082 ctermfg=0 ctermbg=27

hi StatusLine guifg=white guibg=#000082 gui=bold ctermfg=15 ctermbg=27 cterm=bold
hi StatusLineNC guifg=#c0c0c0 guibg=white ctermfg=245 ctermbg=252
hi VertSplit guifg=#c2c2c2 guibg=#c2c2c2 ctermfg=251 ctermbg=251

hi NonText guifg=#bebebe guibg=#f2f2f2 ctermfg=250 ctermbg=255
hi Comment guifg=#478C23 ctermfg=22
hi Folded guifg=#708090 guibg=#c0d0e0 ctermfg=245 ctermbg=251
hi FoldColumn guifg=#708090 guibg=#c0d0e0 ctermfg=245 ctermbg=251

hi Constant guifg=black ctermfg=0
hi Number guifg=black ctermfg=0
hi Float guifg=black ctermfg=0
hi Boolean guifg=#4070a0 ctermfg=27
hi String guifg=#4070a0 ctermfg=32

hi Statement guifg=#0048ff ctermfg=27
hi Type guifg=#0048ff ctermfg=27
hi Structure guifg=#0048ff ctermfg=27
hi Identifier guifg=black ctermfg=27
hi Function guifg=#0048ff ctermfg=27
hi Repeat guifg=#0048ff gui=bold ctermfg=27 cterm=bold
hi Conditional guifg=#0048ff gui=bold ctermfg=27 cterm=bold
hi Operator guifg=#0048ff ctermfg=0

hi PreProc guifg=#0048ff ctermfg=27
hi Define guifg=#0048ff ctermfg=27
hi Include guifg=#0048ff ctermfg=27

hi Error guifg=#d00000 guibg=white gui=bold,underline ctermfg=196 ctermbg=15 cterm=bold,underline
hi Todo guifg=white guibg=#000082 gui=bold ctermfg=15 ctermbg=27 cterm=bold
hi SpecialKey guifg=#000082 guibg=#f0f0f0 ctermfg=32 ctermbg=255
hi Special guifg=black guibg=white ctermfg=0 ctermbg=15

" Diff
hi DiffChange guibg=#e0e0e0 gui=bold ctermbg=254 cterm=bold
hi DiffText guibg=#f0c8c8 gui=bold ctermbg=217 cterm=bold
hi DiffAdd guibg=#c0e0d0 gui=bold ctermbg=151 cterm=bold
hi DiffDelete guibg=#f0e0b0 gui=bold ctermbg=221 cterm=bold

" Other
hi ColorColumn guifg=black guibg=#f2f2f2 ctermfg=0 ctermbg=255
hi ErrorMsg guifg=#d00000 guibg=white ctermfg=196 ctermbg=15
hi MoreMsg guifg=#0048ff ctermfg=27
hi Search guibg=#ffcc00 guifg=black ctermbg=220 ctermfg=0
hi SpellBad guifg=#d00000 gui=underline ctermfg=196 cterm=underline
hi SpellCap guifg=#0048ff gui=underline ctermfg=27 cterm=underline
hi SpellLocal guifg=#478C23 gui=underline ctermfg=28 cterm=underline
hi SpellRare guifg=#800080 gui=underline ctermfg=90 cterm=underline
hi WarningMsg guifg=#d00000 ctermfg=196

