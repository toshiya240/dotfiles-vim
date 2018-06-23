if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead *.fish   setf fish
  au! BufNewFile,BufRead *.md     setf markdown
  au! BufNewFile,BufRead *.coffee setf coffee
  au! BufNewFile,BufRead *.oct    setf octave
augroup END

augroup FileTypeConfig
  au!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  au FileType * setl fo=tcrqlmB nocin comments& dictionary<
augroup END
