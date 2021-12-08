set nocompatible
"配置插件管理
filetype off

let s:bundle_home = g:spx_home.'/.vim/bundle/'
let s:bundle_plug = s:bundle_home.'vim-plug/plug.vim'
"echo s:bundle_home
"echo s:bundle_plug

""if empty(glob(expand("$BUNDLE/vim-plug")))
"    silent !curl -fLo $BUNDLE/plug.vim --create-dirs
"                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
"endif

"load plug.vim bundle
" source g:spx_home.'/.vim/bundle/vim-plug/plug.vim'
exec ":source ".s:bundle_plug
call plug#begin(s:bundle_home)

"--------------------
" for common
"--------------------

Plug 'xvhfeng/vim-plug'

Plug 'vim-scripts/genutils'

"Plug 'vim-scripts/ZoomWin'

"move bunch
Plug 'easymotion/vim-easymotion'
" <Leader>f{char} to move to {char}
map  gc <Plug>(easymotion-bd-f)
nmap gc <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap gb <Plug>(easymotion-overwin-f2)

" Move to line
map gl <Plug>(easymotion-bd-jk)
nmap gl <Plug>(easymotion-overwin-line)

" Move to word
map  gw <Plug>(easymotion-bd-w)
nmap gw <Plug>(easymotion-overwin-w)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

Plug 'vim-scripts/ZoomWin'

Plug 'trotter/autojump.vim'

Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=1
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

Plug 'terryma/vim-expand-region'
map + <Plug>(expand_region_expand)
map _ <Plug>(expand_region_shrink)

" 快速加入修改环绕字符
" put ds' delete '
" put cs' ( change ' to ()
" ysiw' insert ' round word with space
" ysiwb insert () round word without space
" yss' insert ' round line
Plug 'tpope/vim-surround'
nmap yw ysiwb
nmap  yl yssb

" for repeat -> enhance surround.vim, . to repeat command
Plug 'tpope/vim-repeat'

" 快速去行尾空格 [, + <Space>]
Plug 'bronson/vim-trailing-whitespace'
map <leader>es :FixWhitespace<cr>

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"多字节支持
Plug 'vim-scripts/FencView.vim'

Plug 'vim-scripts/auto_mkdir'

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 0
let g:airline_section_b = '%{strftime("%Y-%m-%d %T")}'

Plug 'Yggdroot/indentLine'
"config for indentLine
let g:indentLine_indentLevel = 15
let g:indentLine_enabled = 1
"hi Conceal ctermfg=red ctermbg=red
"let g:indentLine_char = '|'

"--------------------
" for c
"--------------------

Plug 'vim-scripts/a.vim'
if (!exists('g:alternateSearchPath'))
    let g:alternateSearchPath = 'sfr:./,sfr:include/,sfr:../,sfr:header/,sfr:../src,sfr:../include,sfr:../header,sfr:../../include,sfr:../../src'
endif

"设置c语言的header和c文件转换
nnoremap he <ESC>:w!<ESC>:A!<CR>
nnoremap <c-x>h <ESC>:w!<ESC>:A!<cr>

Plug 'scrooloose/nerdcommenter'
map cc \cc
map cu \co
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_c = 1
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" 多语言语法检查
Plug 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
highlight SyntasticErrorSign guifg=white guibg=black

Plug 'tpope/vim-commentary'

Plug 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_returnTag="@Returns:"
let g:DoxygenToolkit_paramTag_pre="@"
let g:DoxygenToolkit_briefTag_pre="@Remark:"
map <c-x><c-f> <ESC>:Dox<cr>

"--------------------
" for markdown
"--------------------

"###### Markdown #########
"Plug 'plasticboy/vim-markdown'
"let g:vim_markdown_folding_disabled=1
"let g:vim_markdown_conceal = 0

"--------------------
" for subject
"--------------------
"主题 solarized
Plug 'altercation/vim-colors-solarized'
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

"主题 molokai
Plug 'tomasr/molokai'
"let g:molokai_original = 1

"Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'kamichidu/vim-edit-properties'

"--------------------
" for javascript
"--------------------
"Plug 'nono/jquery.vim'
"Plug 'pangloss/vim-javascript'
"let g:html_indent_inctags = "html,body,head,tbody"
"let g:html_indent_script1 = "inc"
"let g:html_indent_style1 = "inc"

"--------------------
" for html, haml, sass
"--------------------
Plug 'vim-scripts/JSON.vim'

"--------------------
" for database
"--------------------
Plug 'vim-scripts/SQLComplete.vim'
let g:sql_type_default = 'mysql'

Plug 'Shougo/vimproc'
Plug 'Shougo/unite.vim'
let g:unite_enable_split_vertically = 1
let g:unite_source_file_async_command = "ls -las"
let g:unite_ignore_source_files = ['*.o']
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_source_line_enable_highlight = 1

Plug 'tpope/vim-unimpaired'


"内置exploer
nnoremap <c-g> :Explore <CR>
nnoremap <silent> <leader>gg :Explore <CR>
let g:netrw_hide = 1 "设置默认隐藏
let g:netrw_liststyle = 3 " tree 模式显示风格
let g:netrw_banner = 0 " 显示帮助信息
let g:netrw_browse_split = 0 "控制 <CR> 直接在当前窗口打开光标下文件
let g:netrw_winsize = 30 " 占用宽度
let g:netrw_list_hide= '\(^\|\s\s\)\zs\.\S\+' " 需要隐藏的文件
let g:netrw_localrmdir = 'trash' "默认的删除工具使用 trash
let g:netrw_altv = 1 " 控制 v 分裂的窗口位于右边
let g:netrw_preview = 1 " 默认是水平分割, 此项设置使之垂直分割
let g:netrw_alto = 0 " 控制预览窗口位于左侧或右侧, 与 netrw_preview 共同作用
" let g:netrw_chgwin = 2 " 控制按下 <CR> 的新文件在位于屏幕右侧的 2 号窗口打开, Lex 默认会设为 2


Plug 'Shougo/unite-outline'
nnoremap <c-x>o :Unite  -start-insert -no-split outline<CR>

Plug 'majutsushi/tagbar'
nnoremap <c-c>o :TagbarToggle<CR>

let g:tagbar_width=60
let g:tagbar_right=1
" 启动时自动focus
let g:tagbar_autofocus = 1
map + :tagbar_map_openfold
map - :tagbar_map_closefold

Plug 'ervandew/supertab'

Plug 'Yggdroot/LeaderF'
 let g:Lf_WorkingDirectoryMode = 'F'
 let g:Lf_WindowPosition = 'fullScreen'
 let g:Lf_PreviewInPopup = 1
 let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
 "let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

nnoremap <c-c><c-f> :Leaderf rg <SPACE>
noremap <c-x><c-f> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
"select file from current floder
let g:Lf_ShortcutF = "<leader>ff"
" select from opened buffer
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" select from history
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
"select from current buffer
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap fh :<C-U>Leaderf! rg --recall<CR>

"<C-C>, <ESC> : 退出 LeaderF.
"<C-R> : 在模糊匹配和正则式匹配之间切换
"<C-F> : 在全路径搜索和名字搜索之间切换
"<Tab> : 在检索模式和选择模式之间切换
"<C-J>, <C-K> : 在结果列表里选择
"<C-X> : 在水平窗口打开
"<C-]> : 在垂直窗口打开
"<C-T> : 在新标签打开
"<C-P> : 预览结果

"Plug 'dyng/ctrlsf.vim'
"nmap gfw :CtrlSFQuickfix <C-R>=expand("<cword>") <CR>
"nmap gfa :CtrlSF <C-R>=expand("<cword>") <CR>
"let g:ctrlsf_mapping  = {
"            \ "openb"    : ["<CR>", "o"],
"            \ "open"   : "O",
"            \ "split"   : "<C-O>",
"            \ "vsplit"  : "",
"            \ "tab"     : "t",
"            \ "tabb"    : "T",
""            \ "popen"   : "p",
"            \ "quit"    : "q",
"            \ "next"    : "<C-J>",
"            \ "prev"    : "<C-K>",
"            \ "pquit"   : "q",
"            \ "loclist" : "",
"            \ }

"Plug 'mileszs/ack.vim'
"""let g:ackprg = 'ag --nogroup --color --column'
"nnoremap ga :Ack<space>

"中文排版"
Plug 'hotoo/pangu.vim'

Plug 'will133/vim-dirdiff'

"cmake的提示
Plug 'pboettch/vim-cmake-syntax'

"光标下的单词高亮"
Plug 'pboettch/vim-highlight-cursor-words'
let g:HiCursorWords_linkStyle='VisualNOS'

Plug 'xvhfeng/vim-clang-format'
let g:clang_format#auto_format = 1
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" " if you install vim-operator-user
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" " Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
let g:clang_format#style_options = {
            \ "AllowShortFunctionsOnASingleLine" : "None",
            \"AllowShortIfStatementsOnASingleLine" : "false",
            \"AllowShortLoopsOnASingleLine" : "false",
            \"AllowAllParametersOfDeclarationOnNextLine" : "false",
            \"BinPackArguments" :   "true",
            \"BinPackParameters" :  "false",
            \"BreakBeforeBinaryOperators" : "All",
            \"BreakBeforeTernaryOperators" : "true",
            \"ConstructorInitializerAllOnOneLineOrOnePerLine" : "true",
            \"ColumnLimit" : "0",
            \"Cpp11BracedListStyle" : "false",
            \"ExperimentalAutoDetectBinPacking" : "true",
            \"ReflowComments" : "true",
            \"SortIncludes" :   "true",
            \"SpaceAfterCStyleCast" : "true",
            \"SpaceInEmptyParentheses" : "true",
            \"SpacesInParentheses" :    "false",
            \"SpacesInSquareBrackets" : "true",
            \"SpaceBeforeAssignmentOperators" : "true",
            \"UseTab" : "Never",
            \"AlignTrailingComments" : "true",
            \"CommentPragmas" :  "'^ IWYU pragma:'"
            \}

Plug 'xvhfeng/gft4c'

"括号对齐颜色
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

Plug 'xvhfeng/google.vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'rust-lang/rust.vim'

"new file windows mgr in vim
"must install nnn,you can install by github
""Plug 'mcchrish/nnn.vim'
" Disable default mappings
""let g:nnn#set_default_mappings = 0
" Then set your own
""nnoremap <silent> <leader>nn :NnnPicker<CR>
" Or override
" Start nnn in the current file's directory
""nnoremap <silent> <leader>n :NnnPicker '%:p:h'<CR>
" Opens the nnn window in a split
""let g:nnn#layout = 'new' " or vnew, tabnew etc.
"
" Or pass a dictionary with window size
""let g:nnn#layout = { 'left': '~20%' } " or right, up, down
"
" Floating window (neovim latest and vim with patch 8.2.191)
""let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
""let g:nnn#action = {
            ""\ '<c-t>': 'tab split',
            ""\ '<c-x>': 'split',
            ""\ '<c-v>': 'vsplit' }
""let g:nnn#command = 'nnn -d'

" or pass some env variables
""let g:nnn#command = 'NNN_TRASH=1 nnn -d'

Plug 'wellle/context.vim'
let g:context_enabled = 1
autocmd VimEnter     * ContextActivate
autocmd BufAdd       * call context#update('BufAdd')
autocmd BufEnter     * call context#update('BufEnter')
autocmd CursorMoved  * call context#update('CursorMoved')
autocmd VimResized   * call context#update('VimResized')
autocmd CursorHold   * call context#update('CursorHold')
autocmd User GitGutter call context#update('GitGutter')
nnoremap <silent> <C-Y> <C-Y>:call context#update('C-Y')<CR>
nnoremap <silent> <C-E> <C-E>:call context#update('C-E')<CR>
nnoremap <silent> zz       zz:call context#update('zz')<CR>
nnoremap <silent> zb       zb:call context#update('zb')<CR>
nnoremap <silent> <expr> zt context#util#map_zt()
nnoremap <silent> <expr> H  context#util#map_H()

"Plug 'vifm/vifm.vim'
"nnoremap <silent> <leader>mm :Vifm<CR>

"need install ranger
"replace vifm
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
 "open ranger when vim open a directory
let g:ranger_replace_netrw = 1
nnoremap <silent> <leader>mm :Ranger<CR>

Plug 'jlanzarotta/bufexplorer'
nnoremap <silent> <c-x>b :ToggleBufExplorer<CR>
nnoremap <silent> <leader>bb :ToggleBufExplorer<CR>
nnoremap <silent> <c-x><c-b> :BufExplorerVerticalSplit<CR>
nnoremap <silent> <leader>bb :ToggleBufExplorer<CR>

Plug 'vim-scripts/lemon.vim'

    Plug 'scrooloose/nerdtree'
    Plug 'xvhfeng/nerdtree'          " File tree manager
    "开启/关闭nerdtree快捷键
    nnoremap <silent> <leader>nn :NERDTreeToggle<CR>
    "设置树的显示图标
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
    let g:NERDTreeChDirMode = 3  "Change current folder as root
    "当NERDTree为剩下的唯一窗口时自动关闭
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
    let NERDTreeQuitOnOpen=1   " Close NERDtree when files was opened
    let NERDTreeMinimalUI=1    " Start NERDTree in minimal UI mode (No help lines)
    let NERDTreeDirArrows=1    " Display arrows instead of ascii art in NERDTree
    let g:NERDTreeHidden=1     " Don't show hidden files
    let NERDTreeWinSize=30     " Initial NERDTree width
    let NERDTreeAutoDeleteBuffer = 1  " Auto delete buffer deleted with NerdTree
    let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '__pycache__','\.o']   " Hide temp files in NERDTree
    let g:NERDTreeShowLineNumbers=1  " Show Line Number
    Plug 'jistr/vim-nerdtree-tabs'      " enhance nerdtree's tabs
    Plug 'ryanoasis/vim-devicons'       " add beautiful icons besides files
    Plug 'Xuyuanp/nerdtree-git-plugin'  " display git status within Nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " enhance devicons

Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

call plug#end()
filetype plugin indent on
filetype on
