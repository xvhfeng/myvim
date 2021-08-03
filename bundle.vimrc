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
Plug 'vim-scripts/genutils'

Plug 'vim-scripts/ZoomWin'

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
"有的时候gloable可以 有的local设置可以，需要是一下环境
Plug 'xvhfeng/c.vim'

if g:ENV == "LINUX"
    let g:C_GlobalTemplateFile  = g:spx_home.'/.vim/bundle/c.vim/c-support/templates/Templates'
    let g:C_GlobalTemplateDir       =  g:spx_home.'/.vim/bundle/c.vim/c-support/templates'
else "for mac
    let g:C_LocalTemplateFile       = g:spx_home.'/.vim/bundle/c.vim/c-support/templates/Templates'
    let g:C_LocalTemplateDir        = g:spx_home.'/.vim/bundle/c.vim/c-support/templates'
endif

map cc \cc
map cu \co
"map <M-x><M-c> \cc

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
nmap gfw :CtrlSFQuickfix <C-R>=expand("<cword>") <CR>
nmap gfa :CtrlSF <C-R>=expand("<cword>") <CR>
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

Plug 'mileszs/ack.vim'
"let g:ackprg = 'ag --nogroup --color --column'
nnoremap ga :Ack<space>

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
Plug 'mcchrish/nnn.vim'
" Disable default mappings
let g:nnn#set_default_mappings = 0
" Then set your own
nnoremap <silent> <leader>n :NnnPicker<CR>
" Or override
" Start nnn in the current file's directory
nnoremap <silent> <leader>nn :NnnPicker '%:p:h'<CR>
" Opens the nnn window in a split
let g:nnn#layout = 'new' " or vnew, tabnew etc.
"
" Or pass a dictionary with window size
let g:nnn#layout = { 'left': '~20%' } " or right, up, down
"
" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = {
            \ '<c-t>': 'tab split',
            \ '<c-x>': 'split',
            \ '<c-v>': 'vsplit' }
let g:nnn#command = 'nnn -d'

" or pass some env variables
let g:nnn#command = 'NNN_TRASH=1 nnn -d'

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
Plug 'francoiscabrol/ranger.vim'
nnoremap <silent> <leader>mm :Ranger<CR>

Plug 'jlanzarotta/bufexplorer'
nnoremap <silent> <c-x>b :ToggleBufExplorer<CR>
nnoremap <silent> <c-x><c-b> :BufExplorerVerticalSplit<CR>

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
let g:coc_global_extensions = ['coc-tsserver',
            \'coc-template',
            \'coc-highlight' ,
            \'coc-yaml',
            \'coc-vimlsp',
            \'coc-rls',
            \'coc-go',
            \'coc-java',
            \'coc-clangd']
inoremap <silent><expr> <c-j>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr>  <c-j> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> <c-k> :call <SID>show_documentation()<CR>
inoremap <silent><expr>  <c-j> coc#refresh()

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}




call plug#end()
filetype plugin indent on
filetype on
