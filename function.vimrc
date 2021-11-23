" Base Settings  基本设置
" all function by myself
"==========================================

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
    if "xterm" == &term
        call setreg("",lines)
    else
        call setreg("+",lines)
    endif
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

noremap <leader>fg :call GetCurrentCursor()<cr>
noremap <leader>fc :cal ClearCurrentCursor()<cr>
noremap <leader>fy :call CopyLinesToSystem()<cr>
noremap <leader>fd :call DeleteLines()<cr>
noremap <leader>fr :call ReName()<cr>

nmap <M-g> :call GetCurrentCursor()<cr>
nmap <M-c> :call ClearCurrentCursor()<cr>
nmap <M-y> :call CopyLinesToSystem()<cr>
nmap <M-d> :call DeleteLines()<cr>
nmap <M-r> :call ReName()<cr>


function! DeleteShiftLines()
    let lines = input("input above lines count:")
    if 0 == lines
        return
    endif
    exec "normal ".lines."k"
    exec "normal ".lines."dd"
endfunction
noremap <leader>sd :call DeleteShiftLines()<cr>


"设定当前列高亮
function! SetColorColumn(cnum)
    let col_num = 0
    if 0 < a:cnum
        let col_num = a:cnum
        echo col_num
    else
        let col_num = virtcol(".")
    endif
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction
map <leader>ch :call SetColorColumn(0)<CR>
autocmd BufNewFile *.c,*.py,*.md exec ":call SetColorColumn(80)"

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py,*.md exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\#  -*- encoding: utf-8 -*-")
    endif

    if &filetype == 'mkd' || &filetype == 'md'
        call setline('.',"---")
        normal ==o
        call setline('.',"layout: post")
        normal ==o
        call setline('.',"categories: []")
        normal ==o
        call setline('.',"title: \" \"")
        normal ==o
        call setline('.',"tags: []")
        normal ==o
        call setline('.',"---")
        normal ==o
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

function! SpxFormat()
python << endpython
import vim
import sys
spx_linecount = 40
newlines = [ ]
b = vim.current.buffer
for line in b :
    sline = line.decode("utf8")
    llen = len(sline)
    times = llen / spx_linecount
    if 0 != (llen % spx_linecount) :
        times = times + 1
    for i in range(times) :
        begin = i * spx_linecount
        end = (i + 1) * spx_linecount
        if end > llen :
            end = llen
        newline = sline[begin : end]
        newlines.append(newline.encode("utf8"))

del b[ : ]
b.append(newlines)
endpython
endfunction

let g:rnd = localtime() % 0x10000

function! Random(n) abort
    "let i = 0
    "let al = []
    "while i < 100
        let g:rnd = (g:rnd * 31421 + 6927) % 0x10000
        let r = g:rnd * a:n/0x10000
        "call add(al,r)
        "let i = i + 1
    "endwhile
    "echo al
    return r
endfunction

function! RandomHex() abort
    return Random(0x7FFFFFFF)
endfunction

function! GenFileRandom()
    let currLine = line('.')
    let sourcefilename=expand("%:t")
    let definename=substitute(sourcefilename,' ','','g')
    let definename=substitute(definename,'\.','_','g')
    let definename = toupper(definename)
    exe 'normal '.currLine.'GO'
    let randFF = RandomHex()
    call setline('.', '/* random integer for file generate by automatic ')
    normal o
    call setline('.', '*  it use for memory allocator and debug ')
    normal o
    call setline('.', '*  so do not delete and keep name start with current filename */')
    normal o
    call setline('.', 'static int '.definename.'_RANDOMS = '.randFF.';')
    normal o
endfunction

nmap la :call GenFileRandom()<CR>



"替换命令
fun! SetupCommandAlias(from, to)
    exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

function! IndentIgnoringComments()
 let in_comment = 0
  for i in range(1, line('$'))
    if !in_comment
      " Check if this line starts a comment
      if getline(i) =~# '^\s*/\*'
      "if getline(i) =~# '^\s*/\*\*'
        let in_comment = 1
      else
        " Indent line 'i'
        execute i . "normal =="
      endif
    else
      " Check if this line ends the comment
      if getline(i) =~# '\*\/\s*$'
        let in_comment = 0
      endif
    endif
  endfor
endfunction
nnoremap <leader>= :call IndentIgnoringComments()<CR>

" -- New file .h .C .cpp, add file header --
autocmd BufNeWFile *.[ch] exec ":call CFileHeader( )"
autocmd BufNeWFile *.hpp,*.cc exec ":call CPPFileHeader( )"

func CFileHeader()
    call setline(1,"/*************************************************************")
    normal o
    call setline(("."),"*")
    normal o
    call setline(("."),"* You can copy the software or lib under the terms of the gnu")
    normal o
    call setline(("."),"* general public license v3,which may be found in the source")
    normal o
    call setline(("."),"* kit.")
    normal o
    call setline(("."),"*")
    normal o
    call setline(("."),"* Warning:")
    normal o
    call setline(("."),"*   If use the code for bussiness or any act of gain, you must")
    normal o
    call setline(("."),"* get my green light with mail or any documentary evidence.")
    normal o
    call setline(("."),"*")
    normal o
    call setline(("."),"*")
    normal o
    call setline((".") ,"* Author:  Seapeak.Xu (www.94geek.com)")
    normal o
    call setline((".") ,"* Mail:    xvhfeng@gmail.com")
    normal o
    call setline((".") , "* Date: " .strftime ("%Y/%m/%d %H:%M:%S"))
    normal o
    call setline((".") ,"*")
    normal o
    call setline((".") ,"*")
    normal o
    call setline((".") , "* File: ".strftime( expand( '%d')))
    normal o
    call setline((".") ,"*    -- ")
    normal o
    call setline(("."),"***************************************************************/")
    normal o
    call setline((".") , "")
    normal o
    exec "$"
endfunc


func CPPFileHeader()
    call setline(1,"/*************************************************************")
    normal o
    call setline(("."),"*")
    normal o
    call setline(("."),"* You can copy the software or lib under the terms of the gnu")
    normal o
    call setline(("."),"* general public license v3,which may be found in the source")
    normal o
    call setline(("."),"* kit.")
    normal o
    call setline(("."),"*")
    normal o
    call setline(("."),"* Warning:")
    normal o
    call setline(("."),"*   If use the code for bussiness or any act of gain, you must")
    normal o
    call setline(("."),"* get my green light with mail or any documentary evidence.")
    normal o
    call setline(("."),"*")
    normal o
    call setline(("."),"*")
    normal o
    call setline((".") ,"* Author:  Seapeak.Xu (www.94geek.com)")
    normal o
    call setline((".") ,"* Mail:    xvhfeng@gmail.com")
    normal o
    call setline((".") , "* Date: " .strftime ("%Y/%m/%d %H:%M:%S"))
    normal o
    call setline((".") ,"*")
    normal o
    call setline((".") ,"*")
    normal o
    call setline((".") , "* File: ".strftime( expand( '%d')))
    normal o
    call setline((".") ,"*    -- ")
    normal o
    call setline(("."),"***************************************************************/")
    normal o
    call setline((".") , "")
    normal o
    exec "$"
endfunc

function! SpxInsertHeadDef(firstLine, lastLine)
    if a:firstLine <1 || a:lastLine> line('$')
        echoerr 'InsertHeadDef : Range overflow !(FirstLine:'.a:firstLine.';LastLine:'.a:lastLine.';ValidRange:1~'.line('$').')'
        return ''
    endif
    let sourcefilename=expand("%:t")
    let definename=substitute(sourcefilename,' ','','g')
    let definename=substitute(definename,'\.','_','g')
    let definename = toupper(definename)
    exe 'normal '.a:firstLine.'GO'
    call setline('.', '#ifndef _'.definename."_")
    normal o
    call setline('.', '#define _'.definename."_")
    normal o
    call setline('.', '#ifdef __cplusplus')
    normal o
    call setline('.', 'extern "C" {')
    normal o
    call setline('.', '#endif')
    normal o
    exe 'normal =='.(a:lastLine-a:firstLine+1).'jo'
    call setline('.', '#ifdef __cplusplus')
    normal o
    call setline('.', '}')
    normal o
    call setline('.', '#endif')
    normal o
    call setline('.', '#endif')
    let goLn = a:firstLine+2
    exe 'normal =='.goLn.'G'
endfunction

function! SpxInsertHeadDefN()
    let firstLine = 21
    let lastLine = line('$')
    let n=21
    "50 is the magic number
    "if you file init context size is more than 50,
    "plesae set  larger again.
    while n < 80
        let line = getline(n)
        if n==21
            if line =~ '^\/\*.*$'
                let n = n + 1
                continue
            else
                break
            endif
        endif
        if line =~ '^.*\*\/$'
            let firstLine = n+1
            break
        endif
        let n = n + 1
    endwhile
    call SpxInsertHeadDef(firstLine, lastLine)
endfunction

nmap ha :call SpxInsertHeadDefN()<CR>
autocmd BufNewFile *.h,*.hpp :call SpxInsertHeadDefN()


