let g:deoplete#sources#rust#racer_binary=expand('$HOME/.cargo/bin/racer')
let s:rust_sysroot=substitute(system('rustc --print sysroot'), '\n', '', '')
let g:deoplete#sources#rust#rust_source_path=s:rust_sysroot . '/lib/rustlib/src/rust/src'
