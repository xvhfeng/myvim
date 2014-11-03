"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================

let mapleader = ","
nnoremap ; :

" F1 - F6 设置
" F1 废弃这个键,防止调出系统帮助
" F2 行号开关，用于鼠标复制代码用
" F3 显示可打印字符开关
" F4 换行开关
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" F6 语法开关，关闭语法可以加快大文件的展示

" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>

""为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
              "set paste
set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"空格即选中当前项
inoremap <expr> <Space>       pumvisible() ? "\<C-y>\<Space>" : "\<Space>"

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


"tab 缩进
":nmap <tab>  v><esc>
":nmap <s-tab> v<<esc>
:vmap <tab> >gv
:vmap <s-tab> <gv
nmap <tab> %
"Reselect visual block after indent/outdent.调整缩进后自动选中，方便再次操作
" 在visual模式下缩进 (无限可重复)
:vnoremap < <gv
" 译释：:vnoremap 重定义了visual模式下 < 符号的含义
" 把它定义成 <gv
" 即：先<向外缩进，然后gv重新选择上一次选择了的区域
" 这样在visual模式下就可以实现连续按<而连续缩进了
:vnoremap > >gv
" 同里，内缩
":vmap <tab> >gv
":imap <s-tab> <Left>

"粘贴后剪切版不变
xnoremap p pgvy
noremap vp viwpgvy
noremap vy yiw
noremap Y y$

"设置复制使用window粘贴板
if "xterm" == &term
    :nmap <C-p> "*p
    :vmap <C-y> "*y
else
    :nmap <C-p> "+p
    :vmap <C-y> "+y
endif

:nmap Y y$
:vmap Y y$
" y$ -> Y Make Y behave like other capitals
map Y y$


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
:imap <c-e><c-b> <END><Left>

nmap <leader>w :w!<cr>
nmap <leader>e :e<SPACE>
nmap <leader>s i<space><esc>
nmap K i<cr><esc>

"格式化c语言块
:map <leader>fmt <ESC>=a{

nmap <c-e>i <esc>guiw
nmap <c-e>u <esc>gUiw

nmap wv     <C-w>v     " 垂直分割当前窗口
nmap wc     <C-w>c     " 关闭当前窗口
nmap ws     <C-w>s     " 水平分割当前窗口

"set listchars=tab:./ ,trail:.   " 将制表符显示为'.   '

"范围折叠
noremap <c-x>z <esc>zf%

" 用空格键来开关折叠
nmap <space> za

"清除c-x对于数字的按键，为组合键让步
map <c-x> <ESC>

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
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
map j gj
map k gk

" Go to home and end using capitalized directions
noremap H ^
noremap L $l

" select all
map <Leader>sa ggVG"

" select block
nnoremap <leader>v V`}

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

" kj 替换 Esc
inoremap kj <Esc>

" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>


"Jump to start and end of line using the home row keys
nmap t o<ESC>k
nmap T O<ESC>j


" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" 搜索相关
" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>
"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz


":command W w
":command WQ wq
":command Wq wq
":command Q q
":command Qa qa
":command QA qa
