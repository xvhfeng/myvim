set nocompatible
"配置插件管理
filetype off

let $BUNDLE = expand("$HOME/.vim/bundle")

if empty(glob(expand("$BUNDLE/plug.vim")))
    silent !curl -fLo $BUNDLE/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

"load plug.vim bundle
source ~/.vim/bundle/plug.vim
call plug#begin('~/.vim/bundle')

"--------------------
" for common
"--------------------
Plug 'vim-scripts/genutils'

Plug 'vim-scripts/ZoomWin'

"move bunch
Plug 'easymotion/vim-easymotion'
" <Leader>f{char} to move to {char}
map  gf <Plug>(easymotion-bd-f)
nmap gf <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap gc <Plug>(easymotion-overwin-f2)

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

"Plug 'jlanzarotta/bufexplorer'
":vmap <c-x>b <esc>:BufExplorer<cr>
":nmap <c-x>b <esc>:BufExplorer<cr>

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
Plug 'tpope/vim-surround'

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

"undo tree
Plug 'sjl/gundo.vim'
nmap <c-x>u :GundoToggle<CR>
let g:gundo_close_on_revert  = 1

"--------------------
" for c
"--------------------
"有的时候gloable可以 有的local设置可以，需要是一下环境
Plug 'xvhfeng/c.vim'

if g:ENV == "LINUX"
    let g:C_GlobalTemplateFile  = g:spx_home.'/.vim/bundle/c.vim/c-support/templates/Templates'
    let g:C_GlobalTemplateDir       =  g:spx_home.'/.vim/bundle/c.vim/c-support/templates'
else "for mac
    let g:C_LocalTemplateFile       = g:spx_home.'/.vim/bundle/c.vim/c-support/templates/Templates'
    let g:C_LocalTemplateDir        = g:spx_home.'/.vim/bundle/c.vim/c-support/templates'
endif

"nnoremap <c-i>k \cc
"nnoremap <c-i>u \co
map cc \cc
map cu \co
"map <M-x><M-c> \cc

Plug 'vim-scripts/CRefVim'
if !hasmapto('<Plug>CRV_CRefVimInvoke')
    map <silent> <unique> <Leader>ci <Plug>CRV_CRefVimInvoke
endif

Plug 'vim-scripts/a.vim'
if (!exists('g:alternateSearchPath'))
    let g:alternateSearchPath = 'sfr:./,sfr:include/,sfr:../,sfr:header/,sfr:../src,sfr:../include,sfr:../header,sfr:../../include,sfr:../../src'
endif

"设置c语言的header和c文件转换
nnoremap he <ESC>:w!<ESC>:A!<CR>

Plug 'scrooloose/nerdcommenter'
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

"加入代码快
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<Tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Plug 'The-NERD-Commenter'
Plug 'vim-scripts/ShowTrailingWhitespace'

Plug 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_returnTag="@Returns:"
let g:DoxygenToolkit_paramTag_pre="@"
let g:DoxygenToolkit_briefTag_pre="@Remark:"
map <c-x><c-f> <ESC>:Dox<cr>


"--------------------
" for markdown
"--------------------

"###### Markdown #########
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_conceal = 0


"---------------------
"for ReST
"_____________________
Plug 'Rykka/riv.vim'
Plug 'Rykka/InstantRst'

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

Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'kamichidu/vim-edit-properties'

"--------------------
" for javascript
"--------------------
Plug 'nono/jquery.vim'
Plug 'pangloss/vim-javascript'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"--------------------
" for php
"--------------------
Plug 'stephpy/vim-php-cs-fixer'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'shawncplus/phpcomplete.vim'
Plug 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plug 'erikfercak/php-search-doc'
Plug 'lucapette/vim-jquery-doc'

"--------------------
" for html, haml, sass
"--------------------
Plug 'tpope/vim-haml'
" 自动补全html/xml标签
Plug 'docunext/closetag.vim'
let g:closetag_html_style=1

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

"nnoremap <c-x>p :Unite file_rec/async -auto-preview<cr>
nnoremap <c-x>/ :Unite  -start-insert -no-split grep:.<cr>
nnoremap <space>y :Unite -start-insert -no-split history/yank<cr>
nmap <c-x>b :Unite  -no-split -start-insert buffer<cr>
vmap <c-x>b :Unite  -no-split -start-insert buffer<cr>
nnoremap <space>a :UniteBookmarkAdd <cr>
nnoremap <space>c :Unite bookmark<CR>

Plug 'Shougo/neomru.vim'
nnoremap <c-x>m :Unite file_mru<CR>

Plug 'Shougo/vimfiler.vim'
let g:vimfiler_safe_mode_by_default = 0
nnoremap <c-x>f :VimFilerBufferDir<CR>

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

Plug 'dyng/ctrlsf.vim'
nmap fwq :CtrlSFQuickfix <C-R>=expand("<cword>") <CR>
nmap fw :CtrlSF <C-R>=expand("<cword>") <CR>
let g:ctrlsf_mapping  = {
            \ "openb"    : ["<CR>", "o"],
            \ "open"   : "O",
            \ "split"   : "<C-O>",
            \ "vsplit"  : "",
            \ "tab"     : "t",
            \ "tabb"    : "T",
            \ "popen"   : "p",
            \ "quit"    : "q",
            \ "next"    : "<C-J>",
            \ "prev"    : "<C-K>",
            \ "pquit"   : "q",
            \ "loclist" : "",
            \ }


Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-x>p'
nmap <c-x><c-p> <ESC>:CtrlP ../
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_reuse_window = 'netrw'
let g:ctrlp_working_path_mode = 'ca'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 1
let g:ctrlp_match_window_bottom = 1
"修改QuickFix窗口显示的最大条目数
let g:ctrlp_max_height = 50
let g:ctrlp_match_window_reversed = 0
""设置MRU最大条目数为500
let g:ctrlp_mruf_max = 500
let g:ctrlp_follow_symlinks = 1
"默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
let g:ctrlp_by_filename = 1
""默认不使用正则表达式，置1改为默认使用正则表达式，可以用<C-r>进行切换
let g:ctrlp_regexp = 0
"自定义搜索列表的提示符
let g:ctrlp_line_prefix = '♪ '
"let g:ctrlp_match_window = 'right,order:ttb,min:1,max:10,results:25'
 let g:ctrlp_prompt_mappings = {
     \ 'PrtBS()':              ['<bs>', '<c-]>'],
     \ 'PrtDelete()':          ['<del>'],
     \ 'PrtDeleteWord()':      ['<c-w>'],
     \ 'PrtClear()':           ['<c-u>'],
     \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
     \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
     \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
     \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
     \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
     \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
     \ 'PrtHistory(-1)':       ['<c-j>'],
     \ 'PrtHistory(1)':        ['<c-k>'],
     \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
     \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
     \ 'AcceptSelection("t")': ['<c-t>'],
     \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
     \ 'ToggleFocus()':        ['<s-tab>'],
     \ 'ToggleRegex()':        ['<c-r>'],
     \ 'ToggleByFname()':      ['<c-d>'],
     \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
     \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
     \ 'PrtExpandDir()':       ['<tab>'],
     \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
     \ 'PrtInsert()':          ['<c-\>'],
     \ 'PrtCurStart()':        ['<c-a>'],
     \ 'PrtCurEnd()':          ['<c-e>'],
     \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
     \ 'PrtCurRight()':        ['<c-l>', '<right>'],
     \ 'PrtClearCache()':      ['<F5>'],
     \ 'PrtDeleteEnt()':       ['<F7>'],
     \ 'CreateNewFile()':      ['<c-y>'],
     \ 'MarkToOpen()':         ['<c-z>'],
     \ 'OpenMulti()':          ['<c-o>'],
     \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
     \ }

Plug 'tacahiroy/ctrlp-funky'
nnoremap fu :CtrlPFunky<Cr>
nnoremap fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

set rtp+=/opt/soft/fzf
set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf.vim'
nnoremap fs :Files!<CR>
"nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
cnoreabbrev fzf FZF

Plug 'mileszs/ack.vim'
"let g:ackprg = 'ag --nogroup --color --column'
nnoremap ff :Ack<space>

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

Plug 'scrooloose/nerdtree'
set autochdir
let NERDTreeChDirMode=2
map <c-x><c-o> :NERDTree .<CR>
let NERDTreeIgnore=['\.d$[[dir]]', '\.o$[[file]]']
""修改树的显示图标
let g:NERDTreeWinSize = 50 "设定 NERDTree 视窗大小
"没有buffer，自动关闭vim
autocmd bufenter * if (winnr("$")== 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeQuitOnOpen=1
let g:NERDTreeShowLineNumbers=1
""打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree

" jump to the main window.
" autocmd VimEnter * wincmd p



Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeFileExtensionHighlightFullName    = 1
let g:NERDTreeExactMatchHighlightFullName       = 1
let g:NERDTreePatternMatchHighlightFullName     = 1
let g:NERDTreeHighlightFolders                  = 1
let g:NERDTreeHighlightFoldersFullName          = 1
let g:NERDTreeDirArrowExpandable                = '>'
let g:NERDTreeDirArrowCollapsible               = '▼'

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }

Plug 'tenfyzhong/CompleteParameter.vim'
let g:complete_parameter_echo_signature = 1
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
"inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

"括号对齐颜色
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

Plug 'Chiel92/vim-autoformat'
let g:formatdef_my_cpp = '"astyle --style=google"'
let g:formatters_cpp = ['my_cpp']
au BufWrite * :Autoformat

call plug#end()
filetype plugin indent on
filetype on
