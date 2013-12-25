:set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "vundle"
Bundle 'genutils'
Bundle 'c.vim'
Bundle 'The-NERD-Commenter'
Bundle 'ShowTrailingWhitespace'
Bundle 'EasyMotion'
Bundle 'FencView.vim'
Bundle 'The-NERD-tree'
" Bundle 'UltiSnips'
"Bundle 'AutoClose' -- this plug change the timeout and ttimeout fuck.
Bundle 'auto_mkdir'
Bundle 'bufexplorer.zip'
Bundle 'CRefVim'
Bundle 'DoxygenToolkit.vim'
Bundle 'grep.vim'
Bundle 'lookupfile'
Bundle 'ShowMarks'
Bundle 'statusline.vim'
Bundle 'taglist.vim'
Bundle 'vmark.vim--Visual-Bookmarking'
Bundle 'snipMate'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Yggdroot/indentLine'
Bundle 'a.vim'

" golang
" Go
" We are using cespare's modification,
" which uses bradfitz's goimports instead of gofmt.
" With goimports, you can add missing imports automatically.
" To install goimport:
"   go get github.com/bradfitz/goimports
Bundle 'cespare/vim-golang'
" To install godef:
"   go get code.google.com/p/rog-go/exp/cmd/godef
Bundle 'dgryski/vim-godef'
" To install gocode:
"   go get github.com/nsf/gocode
Bundle 'Blackrush/vim-gocode'

Bundle 'bradfitz/goimports'

let g:multi_cursor_use_default_mapping=1

" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

"the cref vim
if !hasmapto('<Plug>CRV_CRefVimInvoke')
    map <silent> <unique> <Leader>ci <Plug>CRV_CRefVimInvoke
endif
:nmap <c-e> $
:imap <c-e><c-b> <END><Left>

"tab 缩进
:nmap <tab>  v><esc>
:nmap <s-tab> v<<esc>
:vmap <tab> >gv
:vmap <s-tab> <gv
"vnoremap < <gv
"vnoremap > >gv
":vmap <tab> >gv
":imap <s-tab> <Left> 

"粘贴后剪切版不变
xnoremap p pgvy
noremap vp viwpgvy
noremap vy yiw
noremap Y y$

"emacs style
":set winaltkeys=no
:imap <C-e> <END>
:imap <C-a> <HOME>
:imap <C-b> <Left>
:imap <C-n> <Down>
:imap <C-p> <Up>
:imap <C-f> <Right>
:imap <C-v> <PageDown>
:imap <C-u> <PageUp>
:imap <C-d> <Delete>
:imap <C-r> <BackSpace>
:imap <c-w><c-b> <s-left>
:imap <c-w> <s-right>

:nmap <F2> :source ~/.vimrc <CR>
:nmap <leader>cl :Calendar<cr>

let NERDTreeWinPos = "left" "where NERD tree window is placed on the screen
let NERDTreeWinSize = 30 "size of the NERD tree
nmap <F7> <ESC>:NERDTreeToggle<RETURN>" Open and close the NERD_tree.vim separately

"当vim就剩下taglist一个窗口是退出vim
"设置编码
set encoding=utf-8
if has("win32") || has("win64")
	set fileencoding=chinese
else
	set fileencodings=utf-8,chinese,latin-1
endif

if !has("gui_running")
	:set tenc=utf-8,gb2312,chinese
endif

:set formatoptions+=mM "format for chinese

:set switchbuf=useopen

"解决菜单乱码
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

"如果帮助无法显示中文,增加这句试试:
set helplang=cn

"设置光标可以到最后一个字面后
set virtualedit=onemore

hi cursorline guibg=#333333 	" highlight bg color of current line
hi CursorColumn guibg=#333333   " highlight cursor

" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :

"设置快捷键等待时间
 " set timeout timeoutlen=300
 set timeout ttimeoutlen=-1

"解决consle输出乱码
language messages zh_CN.utf-8

"设置退格键为删除键
:set backspace=indent,eol,start

"后行根据前一行缩进
:set autoindent

set ambiwidth=double

"开启行号显示
:set number

set copyindent

"开始显示敲入命令
:set showcmd

"设置移动命令在行首或者行尾时依然有效
:set whichwrap=b,s,<,>,[,]

"设置历史命令保存数
:set history=100

"当终端支持颜色显示时打开彩色显示
if &t_Co > 1
	syntax enable
endif

"背景变暗dark，亮设置为light
:set background=dark

"高亮显示
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

"定义givm的颜色和去掉gvim的工具栏
if has("gui_running")
	colorscheme elise
	set guioptions-=T
endif


"识别文件类型
filetype plugin indent on

"关闭智能补全预览窗口
set completeopt=longest,menu

"设置鼠标可以选择文本
:set selectmode+=mouse

"设置自动读取外面对于文件的变更
:set autoread 

"设置命令行高度为2
set cmdheight=1

"设置右下角当前行，列数
set ruler

set nobackup
set nowb
set noswapfile

"与windows共享剪贴板 
set clipboard+=unnamed
"set clipboard+=unamedplus

"折叠代码设置
set foldmethod=marker
"set foldexpr=1

"带有如下符号的单词不要被换行分割 
set iskeyword+=_,$,@,%,#,- 

"增强模式中的命令行自动完成操作 
set wildmenu 

"开启鼠标
set mouse=a

" 启动的时候不显示那个援助索马里儿童的提示 
set shortmess=atI 

" 不让vim发出讨厌的滴滴声 
set noerrorbells 

" 高亮显示匹配的括号 
set showmatch 

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索） 
set incsearch 

"自动切换当前目录为当前文件所在目录
set autochdir

"在单词中间断行
set linebreak

" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set hidden
:set autowrite

"打开时忽略文件名后缀
set wildignore+=*.o,*.obj,*.pyc,*.db

"默认就是全buffer搜索
set gdefault

" 状态行颜色
"highlight StatusLine guifg=SlateBlue guibg=Yellow
"highlight StatusLineNC guifg=Gray guibg=White

"切换到当前tab打开文件的路径下
autocmd BufEnter * cd %:p:h

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

"c程序可以在v模式中按=格式化
set cin 
:set cursorline

"set the tab use 4 space
set expandtab  
set tabstop=4
set smarttab  
set cindent shiftwidth=4
set autoindent shiftwidth=4

"设置一行字数
set tw=78 
"折行
set lbr 
"中文折行不断字
set fo+=mB 

"自动启用vimrc配置
autocmd! bufwritepost .vimrc source ~/.vimrc

set hlsearch
set incsearch
set ignorecase

:let mapleader = ","
nmap <leader>w :w!<cr>
"nmap <leader>q :q!<cr>
"nmap <leader>wq :wq!<cr>
nmap <leader>sh :w<esc>:shell<cr>
nmap <leader>e :e<SPACE>
nmap <leader>s i<space><esc>
nmap K i<cr><esc>

"格式化c语言块
:map <leader>fmt <ESC>=a{

"关闭当前buffer
:vmap <C-x>x <ESC>:bd!<CR>
:nmap <C-x>x <ESC>:bd!<cr>

"切换buffer
:vmap <c-x>b <esc>:w!<esc>,be
:nmap <c-x>b <esc>:w!<esc>,be

"设置前后切换多buffer
:vmap <C-x>j <ESC>:w!<ESC>:bn!<CR>
:vmap <C-x>k <ESC>:w!<ESC>:bp!<CR>
:nmap <C-x>j <ESC>:w!<ESC>:bn!<CR>
:nmap <C-x>k <ESC>:w!<ESC>:bp!<CR>

"设置复制使用window粘贴板
:nmap <C-p> "+p
:vmap <C-y> "+y
:nmap Y y$
:vmap Y y$

"设置c语言的header和c文件转换
:nmap <C-x>h <ESC>:w!<ESC>:A!<CR>

nmap <silent> do :call append('.', '')<CR>j
nmap <silent> uo :call append(line('.')-1, '')<CR>k

nmap <c-e>i <esc>guiw
nmap <c-e>u <esc>gUiw

"set the commnet
:vmap <c-x>c ,cc<ESC>
:nmap <c-x>c ,cc<ESC>
:vmap <c-x>u ,cu<ESC>
:nmap <c-x>u ,cu<ESC>
:vmap <c-x>l ,ci
:nmap <c-x>l ,ci

nmap wv     <C-w>v     " 垂直分割当前窗口
nmap wc     <C-w>c     " 关闭当前窗口
nmap ws     <C-w>s     " 水平分割当前窗口

" 在visual模式下缩进 (无限可重复)
:vnoremap < <gv
" 译释：:vnoremap 重定义了visual模式下 < 符号的含义
" 把它定义成 <gv
" 即：先<向外缩进，然后gv重新选择上一次选择了的区域
" 这样在visual模式下就可以实现连续按<而连续缩进了
:vnoremap > >gv
" 同里，内缩

"set listchars=tab:./ ,trail:.   " 将制表符显示为'.   '

"范围折叠
noremap <M-z> <esc>zf%
"fast shell
:map <C-x>s <ESC>:w!<Esc>:shell<CR>

" 用空格键来开关折叠 
nmap <space> za

"设置搜索插件的快捷键
:nmap <c-g> <ESC>:Grep<CR>

let Tlist_Exit_OnlyWindow = 1  
"taglist窗口是否出现在右边，默认是左边
let Tlist_Use_Right_Window = 1 
"是否在选择了taglist后自动关闭taglist窗口
let Tlist_Close_On_Select = 0 
"是否在打开了taglist的同时把焦点设置到taglist窗口
let Tlist_GainFocus_On_ToggleOpen = 1
"当多个文件在taglist从显示的时候，只打开当前文件，折叠别的文件
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Auto_Update = 1
"map <silent> <leader>tl :TlistToggle<cr>
map <F8> <ESC>:TlistToggle<cr>


"给函数注释
let g:DoxygenToolkit_briefTag_pre="@Remark:" 
let g:DoxygenToolkit_paramTag_pre="@Param:" 
let g:DoxygenToolkit_returnTag="@Returns:"
map <c-x>f <ESC>:Dox<cr>

"ctags文件
set tags+=/opt/symbol/ctags/systags
set tags+=/opt/symbol/ctags/localtags
set tags+=/opt/symbol/ctags/protags

set path =.,/usr/include,/usr/local/include,,/opt/source/octpdfs2/**

"lookupfile config
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
"if filereadable("./filenametags")
"let g:LookupFile_TagExpr = '"./filenametags"'
"endif
nmap <silent> <leader>lf :LookupFile<cr>
nmap <silent> <leader>lb :LUBufs<cr>
nmap <silent> <leader>lw :LUWalk<cr>

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
	let _tags = &tags
	try
		let &tags = eval(g:LookupFile_TagExpr)
		let newpattern = '\c' . a:pattern
		let tags = taglist(newpattern)
	catch
		echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
		return ""
	finally
		let &tags = _tags
	endtry
" Show the matches for what is typed so far.
	let files = map(tags, 'v:val["filename"]')
	return files
endfunction

let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction

function! Crt_symbols()
    :call RunShell("generate symbol","/opt/sys/settings/bin/vim/shell/gen_symbol.sh")
        if filereadable("/opt/symbol/cstags/cscope.out")
            execute "cs add /opt/symbol/cstags/cscope.out"
        endif
endfunction
map <F12> :call Crt_symbols()<cr>

"兼容cscopen和ctags
if has("cscope")
    set cscopetag
     "c-,d-,e-,g-,i-,s-,t-  
     set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
    set csto=0 "first use cscopen tags
    set cst
    "set nocsverb "no show add cscopen success
endif

"change the cscope tag in the quickfix
nmap <c-x><c-n> :cnext<CR>
nmap <c-x><c-p> :cprev<CR>
" nmap <C-t> :colder<CR>:cc<CR>

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

let g:xuhf_begin = 0

function! GetCurrentCursor()
    let g:xuhf_begin = line('.')
    let g:xuhf_begin = g:xuhf_begin + 0
    echo "get current line idx:".g:xuhf_begin
endfunction

function! ClearCurrentCursor()
    let g:xuhf_begin = 0
    echo "clear current cursor is success"
endfunction

function! CopyLinesToSystem()
    let begin_idx = 0
    if 0 != g:xuhf_begin
        let begin_idx = g:xuhf_begin
        let g:xuhf_copy_begin = 0
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
    if 0 != g:xuhf_begin
        let begin_idx = g:xuhf_begin
        let g:xuhf_copy_begin = 0
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
"config for indentLine
let g:indentLine_indentLevel = 5
let g:indentLine_enabled = 1
"hi Conceal ctermfg=red ctermbg=red
"let g:indentLine_char = '|'

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
map ,ch :call SetColorColumn()<CR>

"--------------------------------------------------------------------------- 
" Tip #382: Search for <cword> and replace with input() in all open buffers 
"--------------------------------------------------------------------------- 
fun! Replace() 
    let s:word = input("Replace " . expand('<cword>') . " with:") 
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge' 
    :unlet! s:word 
endfun 

"清除c-x对于数字的按键，为组合键让步
map <c-x> <ESC>
"nunmap <c-x>
"noremap <c-x>
"delete space at the end of the line
"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"map <F9> :!cscope -R -k -b<CR>:cs reset<CR> 
":map <F12> :!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q -f /opt/symbol/ctags/protags /opt/source/**
"config over
"如果无效表达式 ^M 执行 set ff=unix,然后保存即可 

"the mapping for the cmd-line
" start of line
:cnoremap <C-A> <Home>
" back one character
:cnoremap <C-B> <Left>
" delete character under cursor
:cnoremap <C-D> <Del>
" end of line
:cnoremap <C-E> <End>
" forward one character
:cnoremap <C-F> <Right>
" recall newer command-line
:cnoremap <C-N> <Down>
" recall previous (older) command-line
:cnoremap <C-P> <Up>
" back one word
:cnoremap <Esc><C-B> <S-Left>
" forward one word
:cnoremap <Esc><C-F> <S-Right>

" Load Once:
if &cp || exists("g:loaded_escalt") || has("gui_running") || has("win32") || has("win64")
  finish
endif
let s:keepcpo = &cpo
let g:loaded_escalt = 1
set cpo&vim
" ---------------------------------------------------------------------
" Functions:
function Escalt_console()
  for i in range(65, 90) + range(97, 122)
    exe "set <M-".nr2char(i).">=\<Esc>".nr2char(i)
  endfor
  set ttimeoutlen=50
  if &term =~ 'xterm'
    set <F1>=OP
    set <F2>=OQ
    set <F3>=OR
    set <F4>=OS
    set <Home>=OH
    set <End>=OF
  endif
  for i in ["", "c", "i", "x"]
    exe i . "map Ï1;2P <S-F1>"
    exe i . "map Ï1;2Q <S-F2>"
    exe i . "map Ï1;2R <S-F3>"
    exe i . "map Ï1;2S <S-F4>"
  endfor
endfunction
" ---------------------------------------------------------------------
" Call Functions:
call Escalt_console()
" ---------------------------------------------------------------------
"  Restoration And Modelines:
let &cpo= s:keepcpo
unlet s:keepcpo

" let g:EasyMotion_leader_key = '<Leader><Leader>'
let g:EasyMotion_leader_key = 'f'

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

let NERD_c_alt_style = 0    " 将C语言的注释符号改为//, 默认是/**/
let NERDSpaceDelims=1 " 让注释符与语句之间留一个空格

let g:nu_or_rnu = 0
"相对行号和行号切换
function! NuOrRNuSwitch()
    if(0 == g:nu_or_rnu)
        set rnu
        let g:nu_or_rnu = 1
    else
        set nu
        let g:nu_or_rnu = 0
    endif
endfunction
map <c-t> :call NuOrRNuSwitch()<CR>


" Go tags
" To install gotags:
"     go get -u github.com/jstemmer/gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Let's gofmt it before saving it
" autocmd BufWritePre *.go :Fmt
au FileType go au BufWritePre <buffer> Fmt
