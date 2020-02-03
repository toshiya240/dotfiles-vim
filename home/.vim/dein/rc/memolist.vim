let g:memolist_path = '~/Dropbox/Memo/content/posts'
let g:memolist_template_dir_path = '~/.vim/memolist-template'
let g:memolist_memo_suffix = 'md'
if v:version >= 800
  let g:memolist_denite = 1
else
  let g:gemolist_unite = 1
  let g:memolist_unite_source = 'file_rec'
endif


" vimgrep は遅いので grepprg を使用する

function! s:escarg(s)
  return escape(substitute(a:s, '\\', '/', 'g'), ' ')
endfunction

function! Memolist_grep(word)
  let word = a:word
  if word == ''
    let word = input("MemoGrep word: ")
  endif
  if word == ''
    return
  endif

  try
    exe "silent grep" s:escarg(word) s:escarg(g:memolist_path . "/*")
  catch
    redraw | echohl ErrorMsg | echo v:exception | echohl None
  endtry
endfunction

command! -nargs=? MemoGrepPrg :call Memolist_grep(<q-args>)
