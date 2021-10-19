"=================================
"  环境设置
"=================================
"此文件对github忽略，自行保存在工作环境中
"如有需要请按照evn.vimrc.tmpl文件生成
set nocompatible

"自动启用vimrc配置
autocmd! bufwritepost .vimrc source ~/.vimrc
:set switchbuf=useopen
"设置光标可以到最后一个字面后
set virtualedit=onemore
"设置快捷键等待时间
" set timeout timeoutlen=300
set timeout ttimeoutlen=-1
"设置退格键为删除键
set backspace=indent,eol,start
"设置移动命令在行首或者行尾时依然有效
set whichwrap+=b,s,<,>,[,]
set whichwrap+=<,>,h,l
"设置历史命令保存数
set history=1000
"关闭智能补全预览窗口
set completeopt=longest,menu
"设置鼠标可以选择文本
set selectmode+=mouse
"设置自动读取外面对于文件的变更
set autoread
"设置命令行高度为2
set cmdheight=1
set nobackup
set nowb
set noswapfile
"与windows共享剪贴板
set clipboard+=unnamed
"set clipboard+=unamedplus
"增强模式中的命令行自动完成操作
set wildmenu
"开启鼠标
set mouse=a
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

" 不让vim发出讨厌的滴滴声
set novisualbell         " don't beep
set noerrorbells
"自动切换当前目录为当前文件所在目录
set autochdir
"打开时忽略文件名后缀
set wildignore+=*.o,*.obj,*.pyc,*.db,*.swp,*.bak,*.class
"默认就是全buffer搜索
set gdefault
"切换到当前tab打开文件的路径下
autocmd BufEnter * cd %:p:h
autocmd BufEnter * silent! lcd %:p:h
"检测文件类型
filetype on
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on
"create undo file
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=/tmp/vimundo/
endif
" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
"set selection=exclusive
" set selection=inclusive
" set selectmode=mouse,key
" No annoying sound on errors
set title                " change the terminal's title
set t_vb=
set tm=500
" Remember info about open buffers on close"
set viminfo^=%
" For regular expressions turn magic on
set magic

"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================
" 高亮显示匹配的括号
set showmatch
"中文折行不断字
set fo=tqmMB
"set formatoptions=tcqmM "format for chinese
"设置一行字数
set textwidth=80
"折行
set lbr
"带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#
set ambiwidth=double
"开启行号显示
:set number
"显示当前的行号列号：
set ruler
""在状态栏显示正在输入的命令
set showcmd
" Show current mode
set showmode
" Set 7 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间
set scrolloff=7
" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line
set laststatus=2
" 换行。
" set wrap
" How many tenths of a second to blink when matching brackets
set mat=2
" 突出显示当前行等
" set cursorcolumn
set cursorline          " 突出显示当前行

"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 搜索时忽略大小写
set ignorecase
" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch
" 有一个或以上大写字母时仍大小写敏感
" 这句千万不能要，要了命令行大小写敏感了
"set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=marker
set foldlevel=1

" 缩进配置
set smartindent   " Smart indent
set autoindent    " always set autoindenting on
"set copyindent
" never add copyindent, case error   " copy the previous indentation on autoindenting
"c程序可以在v模式中按=格式化
set cin

" tab相关变更
set tabstop=4     " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab     " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set cindent shiftwidth=4
set autoindent shiftwidth=4
set listchars=tab:>-,trail:- "每行起始的tab显示为“>----”；结尾的空格显示为"-"

" A buffer becomes hidden when it is abandoned
" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set hidden
set autowrite
set wildmode=list,full
"开启命令行忽略大小写
set wildignorecase
set ttyfast

"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=


"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"如果帮助无法显示中文,增加这句试试:
set helplang=cn

" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

if has("win32") || has("win64")
    set fileencoding=chinese
else
    set fileencodings=utf-8,chinese,latin-1
endif

if !has("gui_running")
    :set tenc=utf-8
endif

"解决consle输出乱码
language messages zh_CN.utf-8


"==========================================
" Theme Settings  主题设置
"==========================================

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco:h14
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    " set t_Co=256
    "定义givm的颜色和去掉gvim的工具栏
    set guioptions-=T
    " 关闭Vim的自动切换IME输入法(插入模式和检索模式)
    set iminsert=0 imsearch=0
    " 插入模式输入法状态未被记录时，默认关闭IME
    "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
    "高亮显示
    if &t_Co > 2
        syntax on
        set hlsearch
    endif
endif

"当终端支持颜色显示时打开彩色显示
if &t_Co > 1
    syntax enable
endif

" theme主题
"背景变暗dark，亮设置为light
set background=dark
"colorscheme solarized
" colorscheme elise
set t_Co=256

hi cursorline guibg=#333333 	" highlight bg color of current line
hi CursorColumn guibg=#333333   " highlight cursor

"设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

"" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline


"==========================================
" others 其它设置
"==========================================
autocmd! bufwritepost _vimrc source % " vimrc文件修改之后自动加载。 windows。
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux。


" 自动补全配置
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"set open mini-win on right or below
"设置垂直分割的窗口在右边
set splitright
set splitbelow

set mouse-=a

set helplang=cn

" vim 打开ALT按键
function! Terminal_MetaMode(mode)
    set ttimeout
    if $TMUX != ''
        set ttimeoutlen=30
    elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
        set ttimeoutlen=80
    endif
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(mode, key)
        if a:mode == 0
            exec "set <M-".a:key.">=\e".a:key
        else
            exec "set <M-".a:key.">=\e]{0}".a:key."~"
        endif
    endfunc
    for i in range(10)
        call s:metacode(a:mode, nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(a:mode, nr2char(char2nr('a') + i))
        call s:metacode(a:mode, nr2char(char2nr('A') + i))
    endfor
    if a:mode != 0
        for c in [',', '.', '/', ';', '[', ']', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    else
        for c in [',', '.', '/', ';', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    endif
endfunc

call Terminal_MetaMode(0)

