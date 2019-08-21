"==========================================
" Base Settings  基本设置
"==========================================

:set nocompatible

"""""""""""""""""""""""""""""""""""""""""""
" Include vimrc 读取子vimrc
"""""""""""""""""""""""""""""""""""""""""""
" install Vundle bundles

let g:ENV='MAC'
let g:spx_home = "/Users/xuhaifeng"
let g:spx_env_file_path = spx_home."/.vim/env.vimrc"
let g:spx_bundle_file_path = spx_home."/.vim/bundle.vimrc"
let g:spx_keymapping_file_path = spx_home."/.vim/keymapping.vimrc"
let g:spx_function_file_path = spx_home."/.vim/function.vimrc"


if filereadable(expand(g:spx_bundle_file_path))
  exec ":source ".g:spx_bundle_file_path
endif

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

"loading key-mapping
if filereadable(expand(g:spx_keymapping_file_path))
  exec ":source ".g:spx_keymapping_file_path
endif

"loading function
if filereadable(expand(g:spx_function_file_path))
  exec ":source ".g:spx_function_file_path
endif

if filereadable(expand(g:spx_env_file_path))
  exec ":source ".g:spx_env_file_path
endif

