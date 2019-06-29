" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Last Change: 2016/09/11 11:28:48.

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mycolor"
" cterm
" hi Normal     ctermfg=white      ctermbg=black
hi Comment    ctermfg=red
hi Constant   ctermfg=yellow
hi DiffAdd    ctermbg=blue
hi DiffChange ctermbg=darkgreen
hi DiffDelete ctermbg=red
hi DiffText   ctermbg=darkyellow
hi Error      ctermfg=black      ctermbg=red        cterm=bold
hi Function   ctermfg=cyan
hi Identifier ctermfg=cyan       cterm=bold
hi Ignore     ctermfg=grey
hi LineNr     ctermfg=yellow     cterm=bold
hi NonText    ctermfg=grey
hi Note       ctermfg=black      ctermbg=yellow     cterm=bold
hi Operator   ctermfg=red
hi PMenuSel   ctermfg=white      ctermbg=darkgreen  cterm=bold
hi PreProc    ctermfg=magenta
hi Repeat     ctermfg=magenta
hi Search     ctermfg=black      ctermbg=green
hi Special    ctermfg=magenta
hi SpecialKey ctermfg=magenta
hi Statement  ctermfg=magenta
hi Todo       ctermfg=black      ctermbg=yellow
hi Type       ctermfg=cyan
hi User1      ctermbg=blue       cterm=inverse,bold
hi User2      ctermbg=magenta    cterm=inverse,bold
" gui
" hi Normal       guifg=#cccccc    guibg=#002c2d
hi Comment      guifg=salmon
hi Constant     guifg=yellow
hi Cursor       guifg=white      guibg=red
hi CursorLine   guibg=white      gui=underline
hi CursorLineNr guifg=black      guibg=Yellow
hi Error        guifg=black      guibg=red        gui=bold
hi Function     guifg=GoldenRod1
hi Identifier   guifg=orchid
hi Ignore       guifg=grey
hi LineNr       guifg=black      guibg=khaki      gui=bold
hi NonText      guifg=grey50     gui=none
hi Note         guifg=black      guibg=yellow     gui=bold
hi Operator     guifg=red
hi PMenuSel     guibg=SeaGreen
hi PreProc      guifg=orchid
hi Repeat       guifg=orchid
hi Search       guifg=#002c2d    guibg=#cccccc
hi Special      guifg=orchid
hi SpecialKey   guifg=grey50     gui=none
hi Statement    guifg=orchid
hi Todo         guifg=black      guibg=yellow     gui=bold
hi Type         guifg=Orange
hi User1        guibg=blue       gui=inverse,bold
hi User2        guibg=brown      gui=inverse,bold
hi Visual       guifg=white      guibg=black

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String         Constant
hi link Character      Constant
hi link Number         Constant
hi link Boolean        Constant
hi link Float          Number
hi link Conditional    Repeat
hi link Label          Statement
hi link Keyword        Statement
hi link Exception      Statement
hi link Include        PreProc
hi link Define         PreProc
hi link Macro          PreProc
hi link PreCondit      PreProc
hi link StorageClass   Type
hi link Structure      Type
hi link Typedef        Type
hi link Tag            Special
hi link SpecialChar    Special
hi link Delimiter      Special
hi link SpecialComment Special
hi link Debug          Special
hi link helpNote       Todo

" Calndar
hi CalSunday guifg=red
hi CalSaturday guifg=cyan
hi CalToday guifg=yellow
