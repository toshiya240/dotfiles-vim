let g:lightline = {}
let g:lightline.colorscheme = 'landscape'
let g:lightline.active = {}
let g:lightline.active.left  = [
      \ ['mode', 'paste'], ['filename', 'tagname']
      \ ]
let g:lightline.active.right = [
      \ ['fileencoding', 'fileformat', 'filetype'], ['lineinfo'], ['percent']
      \ ]
let g:lightline.inactive = g:lightline.active
let g:lightline.component = {}
let g:lightline.component.lineinfo = 'R%3l:C%-2v'
let g:lightline.component.cd = '%{pathshorten(fnamemodify(getcwd(), ":~"))}'
let g:lightline.component_function = {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'tagname': 'MyTagname',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ }
let g:lightline.separator    = { 'left': "\ue0B0", 'right': "\ue0B2" }
let g:lightline.subseparator = { 'left': "\ue0B1", 'right': "\ue0B3" }
let g:lightline.mode_map = {
      \ 'n' : 'NML',
      \ 'c' : 'NML',
      \ 'i' : 'INS',
      \ 'R' : 'RPL',
      \ 'v' : 'VIS',
      \ 'V' : 'V-L',
      \ "\<C-v>": 'V-B',
      \ 's' : 'SEL',
      \ 'S' : 'S-L',
      \ "\<C-s>": 'S-B',
      \ 't' : 'TRM'
      \ }

let g:lightline.tabline = {'right': [['fugitive', 'cd']]}
let g:lightline.tab = {
      \ 'active':   [ 'tabnum', 'filename', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ }

let g:lightline.tab_component_function = {
      \ 'filename': 'MyTabFilename',
      \ 'modified': 'lightline#tab#modified',
      \ 'readonly': 'lightline#tab#readonly',
      \ 'tabnum': 'lightline#tab#tabnum'
      \ }


function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' :
        \ &modified ? '+' :
        \ &modifiable ? '' :
        \ '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "\uf023" : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (
        \   &ft == 'help' ? expand('%:t') :
        \   &ft == 'unite' ? unite#get_status_string() : 
        \   &ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \   &ft == 'vimshell' ? vimshell#get_status_string() :
        \   '' != expand('%:p:.') ? pathshorten(expand('%:p:.')) : '[No Name]'
        \ ) .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyTabFilename(n)
  let fn = lightline#tab#filename(a:n)
  return WebDevIconsGetFileTypeSymbol(fn) . ' ' . fn
endfunction

function! MyTagname()
  return tagbar#currenttag('%s', '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*FugitiveHead")
    let _ = FugitiveHead()
    return strlen(_) ? "\ue702 "._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) <= 70 ? '' :
        \ WebDevIconsGetFileFormatSymbol()
endfunction

function! MyFiletype()
  return winwidth(0) <= 70 ? '' :
        \ strlen(&filetype) == 0 ? 'no ft' :
        \ WebDevIconsGetFileTypeSymbol() . ' ' . &filetype
endfunction

function! MyFileencoding()
  return winwidth(0) <= 70 ? '' :
        \ strlen(&fenc) ?  &fenc : &enc
endfunction

function! MyMode()
  return winwidth(0) <= 60 ? '' : lightline#mode()
endfunction
