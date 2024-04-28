" vimrc file.
set encoding=utf-8
scriptencoding utf-8

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

let mapleader="\<Space>"
 
"----------------------------------------------------------------------
" 日本語を扱うために {{{
"
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932
set iminsert=0
set imsearch=0

" }}}

"----------------------------------------------------------------------
" ファイル関連 {{{
set nobackup
set swapfile
set directory=~/.vim/tmp/swap//
set undofile
set undodir=~/.vim/tmp/undo

" }}}

"----------------------------------------------------------------------
" 画面表示関係 {{{
"
if has('termguicolors')
  " set termguicolors
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[38:2:%lu:%lu:%lum"
endif
set nonumber
augroup numberwidth
  autocmd!
  autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
augroup END
set cursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
set showcmd				" display incomplete commands
set laststatus=2		" show the status line all the time
set showtabline=2
set cmdheight=2
set pumheight=10
set ambiwidth=single    " for characters with East Asian Width Class Ambiguous
set showmatch			" 閉じ括弧が挿入されたときに、一瞬対応する括弧にジャンプする
set matchtime=1
set nowrap
set display=lastline
set linebreak
set scrolloff=5
set list
set listchars=tab:>-,space:.

set hlsearch

" folding {{{
set foldmethod=indent
set foldlevel=100
set foldcolumn=5
set foldtext=folding#foldtext()
" }}}

" Insert モードでカーソル形状変更
if has('vim_starting')
  let &t_SI = "\e[6 q"
  let &t_EI = "\e[2 q"
  let &t_SR = "\e[4 q"
endif

" }}}

"----------------------------------------------------------------------
" search {{{
"
set incsearch
set nowrapscan
set ignorecase
set smartcase

" grep
if executable('ag')
  set grepprg=ag\ --nogroup\ -iSf
endif
if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif
autocmd QuickFixCmdPost *grep* cwindow
" }}}

"----------------------------------------------------------------------
" 編集関係 {{{
"
set autoread
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set expandtab
set tabstop=4
set textwidth=80
set shiftwidth=4
set cinkeys=0{,0},0),:,0#,!<Tab>,o,O,e
set cino=:0,l1,g0,N-s,E-s,t0,i2s,+2s,u2s,U1,m1

set history=100
set wildmenu

set mouse=a
set ttymouse=xterm2
" mouse の動作を MS-Windows のようにする
behave mswin

source $VIMRUNTIME/macros/matchit.vim
augroup matchit
  au!
  au FileType ruby let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
augroup END

" dict
set dictionary+=/usr/share/dict/words
set dictionary+=/usr/share/dict/connectives

" }}}

"----------------------------------------------------------------------
" misc {{{

set helplang=en,ja
set spelllang=en,cjk

" man
source $VIMRUNTIME/ftplugin/man.vim
" autodate
"" フォーマットを指定する
let autodate_format = '%Y/%m/%d %H:%M:%S'

" Open in Marked
function! OpenInMarked()
  silent !open -a Marked %:p
  redraw!
endfunction
map <leader>xm :call OpenInMarked()<CR>

" Search Dash for word under cursor
function! SearchDash()
  let s:browser = "/usr/bin/open"
  let s:wordUnderCursor = expand("<cword>")
  let s:url = "dash://".s:wordUnderCursor
  let s:cmd ="silent ! " . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction
map <silent><leader>xd :call SearchDash()<CR>

" }}}

"----------------------------------------------------------------------
" dein {{{
if &compatible
  set nocompatible
endif
let g:dein_base_dir = expand('~/.vim/dein')
execute 'set runtimepath+=' . g:dein_base_dir . '/repos/github.com/Shougo/dein.vim'

if dein#load_state(g:dein_base_dir)
  call dein#begin(g:dein_base_dir)

  call dein#load_toml(g:dein_base_dir . '/conf/plugins.toml',  {'lazy': 0})
  call dein#load_toml(g:dein_base_dir . '/conf/filetype.toml', {'lazy': 1})
  call dein#load_toml(g:dein_base_dir . '/conf/insmode.toml',  {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" }}}

" enable ftplugin
filetype plugin on
filetype indent on

runtime! conf/*.vim

" syntax highlighting
syntax on
colorscheme mycolor

" vim: fdm=marker
