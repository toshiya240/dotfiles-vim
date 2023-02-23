" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4 fdm=marker
" Vim color file

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "mycolor"

" cterm {{{
hi Comment    ctermfg=red
hi Constant   ctermfg=yellow
hi DiffAdd    ctermbg=blue
hi DiffChange ctermbg=darkgreen
hi DiffDelete ctermbg=red
hi DiffText   ctermbg=darkyellow
hi Error      ctermfg=black      ctermbg=red        cterm=bold
hi Folded     ctermfg=darkgreen  ctermbg=none       cterm=bold
hi FoldColumn ctermfg=black      ctermbg=darkgray
hi Function   ctermfg=cyan
hi Identifier ctermfg=cyan       cterm=bold
hi Ignore     ctermfg=grey
hi LineNr     ctermfg=yellow     cterm=bold
hi NonText    ctermfg=grey
hi Note       ctermfg=black      ctermbg=yellow     cterm=bold
hi Operator   ctermfg=red
hi Pmenu      ctermfg=white      ctermbg=black
hi PmenuSel   ctermfg=white      ctermbg=darkgreen  cterm=bold
hi PreProc    ctermfg=magenta
hi Repeat     ctermfg=magenta
hi Search     ctermfg=black      ctermbg=green
hi Special    ctermfg=magenta
hi SpecialKey ctermfg=darkgray
hi Statement  ctermfg=magenta
hi Todo       ctermfg=black      ctermbg=yellow
hi Type       ctermfg=cyan
hi User1      ctermbg=blue       cterm=inverse,bold
hi User2      ctermbg=magenta    cterm=inverse,bold
" }}}

" gui {{{
hi Normal       guifg=#cccccc    guibg=#002c2d
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
hi Pmenu        guifg=#cccccc    guibg=DarkGreen
hi PmenuSel     guibg=SeaGreen
hi PreProc      guifg=orchid
hi Repeat       guifg=orchid
hi Search       guifg=#002c2d    guibg=#cccccc
hi Special      guifg=orchid
hi SpecialKey   guifg=DarkGreen  gui=none
hi Statement    guifg=orchid
hi Todo         guifg=black      guibg=yellow     gui=bold
hi Type         guifg=Orange
hi User1        guibg=blue       gui=inverse,bold
hi User2        guibg=brown      gui=inverse,bold
hi Visual                        guibg=#cccccc
" }}}

" Common groups that link to default highlighting. {{{
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
" }}}
