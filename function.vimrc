function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction

function! ReName()
    let old_name = expand("<cword>")
    let old_name = input("old name:",old_name)
	let new_name = input("new name:",old_name)
    let exec = input("are sure to refactor(y/n|Y/N):")
    if 'y' == exec || 'Y' == exec
        let cmd = printf("/opt/sys/settings/bin/vim/shell/ref.sh %s %s",old_name,new_name)
        echo cmd
        :call RunShell("refactoring",cmd)
    endif
endfunction

let g:spx_begin = 0

function! GetCurrentCursor()
    let g:spx_begin = line('.')
    let g:spx_begin = g:spx_begin + 0
    echo "get current line idx:".g:spx_begin
endfunction

function! ClearCurrentCursor()
    let g:spx_begin = 0
    echo "clear current cursor is success"
endfunction

function! CopyLinesToSystem()
    let begin_idx = 0
    if 0 != g:spx_begin
        let begin_idx = g:spx_begin
        let g:spx_cpy_begin = 0
    else
        let begin_idx = line(".")
        let begin_idx = input("begin line idx:",begin_idx)
    endif
    let end_idx = line(".")
    let end_idx = input("end line idx:",end_idx)
    let begin_idx = begin_idx + 0
    let end_idx = end_idx + 0
    if begin_idx > end_idx
        let tmp = begin_idx
        let begin_idx = end_idx
        let end_idx = tmp
    endif
    let list = getline(begin_idx,end_idx)
    let lines = join(list,"\n")
    call setreg("+",lines)
    echo "copy lines to system begin:" . begin_idx . " end:" . end_idx
endfunction

function! DeleteLines()
    let begin_idx = 0
    if 0 != g:spx_begin
        let begin_idx = g:spx_begin
        let g:spx_cpy_begin = 0
    else
        let begin_idx = line('.')
        let begin_idx = input("begin line idx:",begin_idx)
    endif
    let end_idx = line('.')
    let end_idx = input("end line idx:",end_idx)
    let begin_idx = begin_idx + 0
    let end_idx = end_idx + 0
    if begin_idx > end_idx
        let tmp = begin_idx
        let begin_idx = end_idx
        let end_idx = tmp
    endif
    let cur = getpos('.')
    let cur[1] = begin_idx + 0
    let result = setpos('.',cur)
    if(0 != result)
        echo "delete lines begin:" . begin_idx . " end:" . end_idx ." is fail"
        return
    endif
    let lines = abs(begin_idx - end_idx) + 1 "add the line self
    "for fold
    execute ":". begin_idx . "," . end_idx . "de"
    echo "delete lines begin:" . begin_idx . " end:" . end_idx
endfunction

noremap <leader>xg :call GetCurrentCursor()<cr>
noremap <leader>xc :cal ClearCurrentCursor()<cr>
noremap <leader>xy :call CopyLinesToSystem()<cr>
noremap <leader>xd :call DeleteLines()<cr>
noremap <leader>xr :call ReName()<cr>


nmap <M-g> :call GetCurrentCursor()<cr>
nmap <M-c> :call ClearCurrentCursor()<cr>
nmap <M-y> :call CopyLinesToSystem()<cr>
nmap <M-d> :call DeleteLines()<cr>
nmap <M-r> :call ReName()<cr>

"设定当前列高亮
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction
map <leader>ch :call SetColorColumn()<CR>

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc

" 保存文件时删除多余空格
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.vimrc :call DeleteTrailingWS()

" 相对行号      行号变成相对，可以用 nj  nk   进行跳转 5j   5k 上下跳5行
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-t> :call NumberToggle()<cr>

