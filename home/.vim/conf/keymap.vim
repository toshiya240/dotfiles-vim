nnoremap Y y$
inoremap <C-f> <Right>
inoremap <C-b> <Left>

" for command line 
cnoremap <C-a> <Home>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" hlsearch
nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

" toggle spell
nnoremap <silent><leader>s :<C-u>set spell!<CR>:set spell?<CR>

" grep
nnoremap <silent><leader>/ :grep <C-r><C-w><CR>

"
" like Spacemacs {{{
"

" Openning and closing a window
nnoremap <silent><leader>ws     <C-w>s
nnoremap <silent><leader>wv     <C-w>v
nnoremap <silent><leader>wn     <C-w>n
nnoremap <silent><leader>wd     <C-w>c
nnoremap <silent><leader>wc     <C-w>c
nnoremap <silent><leader>wq     <C-w>q
nnoremap <silent><leader>wo     <C-w>o
" Moving cursor to other windows
nnoremap <silent><leader>wj     <C-w>j
nnoremap <silent><leader>wk     <C-w>k
nnoremap <silent><leader>wh     <C-w>h
nnoremap <silent><leader>wl     <C-w>l
nnoremap <silent><leader>ww     <C-w><C-w>
nnoremap <silent><leader>w<C-i> <C-w><C-w>
nnoremap <silent><leader>wt     <C-w>t
nnoremap <silent><leader>wb     <C-w>b
nnoremap <silent><leader>wp     <C-w>p
nnoremap <silent><leader>wP     <C-w>P
" Moving windows arround
nnoremap <silent><leader>wr     <C-w>r
nnoremap <silent><leader>wR     <C-w>R
nnoremap <silent><leader>wx     <C-w>x
nnoremap <silent><leader>wJ     <C-w>J
nnoremap <silent><leader>wK     <C-w>K
nnoremap <silent><leader>wH     <C-w>H
nnoremap <silent><leader>wL     <C-w>L
nnoremap <silent><leader>wT     <C-w>T
" Window resizing
nnoremap <silent><leader>w-     <C-w>-
nnoremap <silent><leader>w+     <C-w>+
nnoremap <silent><leader>w_     <C-w>_
nnoremap <silent><leader>w<     <C-w><
nnoremap <silent><leader>w>     <C-w>>
nnoremap <silent><leader>w<Bar> <C-w><Bar>
" buffers
nnoremap <silent><leader>bd     :<C-u>bd<CR>
nnoremap <silent><leader>bn     :<C-u>bn<CR>
nnoremap <silent><leader>bp     :<C-u>bp<CR>
" files
nnoremap <silent><leader>fe     :Explore .<CR>
nnoremap <silent><leader>fE     :Explore<CR>

" }}}

if dein#tap('vim-clap') " {{{
  nnoremap <silent><leader>bb :<C-u>Clap buffers<CR>
  nnoremap <silent><leader>ff :<C-u>Clap files ++finder=find . -type f<CR>
  nnoremap <silent><leader>fj :<C-u>Clap jumps<CR>
  nnoremap <silent><leader>fl :<C-u>Clap loclist<CR>
  nnoremap <silent><leader>fr :<C-u>Clap history<CR>
  nnoremap <silent><leader>fq :<C-u>Clap quickfix<CR>
  nnoremap <silent><leader>R  :<C-u>Clap registers<CR>
  nnoremap <silent><leader>p  :<C-u>Clap yanks<CR>
endif " }}}

endif " }}}

if dein#tap('neocomplete') " {{{
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  "" Recommended key-mappings.
  "" <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
      return neocomplete#close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  "" <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  "" <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()."\<C-y>"
  inoremap <expr><C-e>  neocomplete#cancel_popup()."\<C-e>"
  "" Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() :
  "\<Space>"
endif " }}}

if dein#tap('neosnippet') " {{{
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  "" SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"
endif " }}}

if dein#tap('memolist.vim') " {{{
  nnoremap <silent><leader>mn :<C-u>MemoNew<CR>
  nnoremap <silent><leader>ml :<C-u>MemoList<CR>
  nnoremap <silent><leader>mg :<C-u>MemoGrepPrg<CR>
endif " }}}

" vim: fdm=marker
