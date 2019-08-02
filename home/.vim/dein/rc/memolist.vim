let g:memolist_path = '~/Dropbox/Memo/00.INBOX'
let g:memolist_template_dir_path = '~/.vim/memolist-template'
let g:memolist_memo_suffix = 'md'
if v:version >= 800
  let g:memolist_denite = 1
else
  let g:gemolist_unite = 1
  let g:memolist_unite_source = 'file_rec'
endif
