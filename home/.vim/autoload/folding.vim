" based on https://coderwall.com/p/usd_cw/a-pretty-vim-foldtext-function

let s:save_cpo = &cpo
set cpo&vim


function! folding#foldtext() " {{{
  let l:lpadding = &fdc
  redir => l:signs
    execute 'silent sign place buffer='.bufnr('%')
  redir End
  let l:lpadding += l:signs =~ 'id=' ? 2 : 0

  if exists("+relativenumber")
    if (&number)
      let l:lpadding += max([&numberwidth, strlen(line('$'))])
    elseif (&relativenumber)
      let l:lpadding += max([
            \ &numberwidth,
            \ strlen(v:foldstart - line('w0')),
            \ strlen(line('w$') - v:foldstart)
            \])
    endif
  else
    if (&number)
      let l:lpadding += max([&numberwidth, strlen(line('$'))])
    endif
  endif

  " expand tabs
  let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
  let l:end = substitute(
        \ substitute(
        \   getline(v:foldend),
        \   '\t',
        \   repeat(' ', &tabstop),
        \   'g'
        \ ),
        \ '^\s*',
        \ '',
        \ 'g'
        \)

  let l:info = '[' . (v:foldend - v:foldstart) . ']'
  let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))

  let l:width = winwidth(0) - l:lpadding - l:infolen

  let l:separator = ' ... '
  let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))

  let l:start = strpart(
        \ l:start,
        \ 0,
        \ l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen
        \)

  let l:text = l:start . l:separator . l:end
  let l:textlen = strlen(substitute(l:text, ".", "x", "g"))

  return l:text . repeat(' ', l:width - l:textlen) . l:info
endfunction " }}}


let &cpo = s:save_cpo
unlet s:save_cpo

" vim: fdm=marker
