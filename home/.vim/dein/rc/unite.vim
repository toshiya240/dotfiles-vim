call unite#custom#profile('default', 'context', {
      \ 'start_insert': 1,
      \ 'winheight': 15,
      \ 'direction': 'botright',
      \ })
let g:unite_source_rec_async_command=['ag', '--nocolor', '--nogroup', '--hidden', '-g', '']        
call unite#filters#matcher_default#use(['matcher_fuzzy'])        
