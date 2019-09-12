set nocompatible
"配置插件管理
filetype off

"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/bundle')

"--------------------
" for common
"--------------------
Plug 'vim-scripts/genutils'

Plug 'vim-scripts/ZoomWin'

"move bunch
Plug 'easymotion/vim-easymotion'
" <Leader>f{char} to move to {char}
map  <c-i><c-f> <Plug>(easymotion-bd-f)
nmap <c-i><c-f> <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <c-i><c-c> <Plug>(easymotion-overwin-f2)

" Move to line
map <c-i><c-l> <Plug>(easymotion-bd-jk)
nmap <c-i><c-l> <Plug>(easymotion-overwin-line)

" Move to word
map  <c-i><c-w> <Plug>(easymotion-bd-w)
nmap <c-i><c-w> <Plug>(easymotion-overwin-w)

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
    let g:C_GlobalTemplateFile	= g:spx_home.'/.vim/bundle/c.vim/c-support/templates/Templates'
    let g:C_GlobalTemplateDir		=  g:spx_home.'/.vim/bundle/c.vim/c-support/templates'
else "for mac
    let g:C_LocalTemplateFile		= g:spx_home.'/.vim/bundle/c.vim/c-support/templates/Templates'
    let g:C_LocalTemplateDir		= g:spx_home.'/.vim/bundle/c.vim/c-support/templates'
endif

"nnoremap <c-i>k \cc
"nnoremap <c-i>u \co
map <c-x>c \cc
map <c-x>cc \co
map <M-x><M-c> \cc

Plug 'vim-scripts/CRefVim'
if !hasmapto('<Plug>CRV_CRefVimInvoke')
    map <silent> <unique> <Leader>ci <Plug>CRV_CRefVimInvoke
endif

Plug 'vim-scripts/a.vim'
if (!exists('g:alternateSearchPath'))
    let g:alternateSearchPath = 'sfr:./,sfr:include/,sfr:../,sfr:header/,sfr:../src,sfr:../include,sfr:../header,sfr:../../include,sfr:../../src'
endif

"设置c语言的header和c文件转换
:nmap <C-x><c-h> <ESC>:w!<ESC>:A!<CR>

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

Plug 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = g:spx_home.'/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-c><c-j>'
"set completeopt=menu,menuone
noremap <c-z> <NOP>
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
highlight PMenu ctermfg=green ctermbg=black guifg=red guibg=red
highlight PMenuSel ctermfg=red ctermbg=black  guifg=red guibg=red

" 直接触发自动补全
"let g:ycm_key_invoke_completion = '<c-x><c-l>'
"let g:ycm_cache_omnifunc = 1
"let g:ycm_auto_trigger = 0
"let g:ycm_enable_diagnostic_signs = 0
"let g:ycm_enable_diagnostic_highlighting = 1
"let g:ycm_echo_current_diagnostic = 1
""youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
"let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
"let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
"let g:ycm_collect_identifiers_from_tags_files = 1
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gi :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gb :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>yd :YcmDiags<CR>
nmap <F11> :YcmRestartServer<CR>

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
nmap <c-c>o :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1
map + :tagbar_map_openfold
map - :tagbar_map_closefold

Plug 'ervandew/supertab'

Plug 'dyng/ctrlsf.vim'
:nmap <c-c>g <ESC>:CtrlSFQuickfix <C-R>=expand("<cword>") <CR>
:nmap <c-c><c-g> <ESC>:CtrlSF <C-R>=expand("<cword>") <CR>
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
:nmap <c-x><c-p> <ESC>:CtrlP ../
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_working_path_mode = 'ca'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

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
map <c-x><c-o> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.d$[[dir]]', '\.o$[[file]]']
"没有buffer，自动关闭vim
autocmd bufenter * if (winnr("$")== 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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

call plug#end()
filetype plugin indent on
filetype on
