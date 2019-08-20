set nocompatible
"配置插件管理
filetype off

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/bundle')

"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"Plug 'gmarik/Vundle.vim'

"--------------------
" for common
"--------------------
Plug 'vim-scripts/genutils'

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

"Plug 'EasyMotion'
Plug 'easymotion/vim-easymotion'
" <Leader>f{char} to move to {char}
map  <c-c>f <Plug>(easymotion-bd-f)
nmap <c-c>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <c-c>s <Plug>(easymotion-overwin-f2)

" Move to line
map <c-c>l <Plug>(easymotion-bd-jk)
nmap <c-c>l <Plug>(easymotion-overwin-line)

" Move to word
map  <c-c>w <Plug>(easymotion-bd-w)
nmap <c-c>w <Plug>(easymotion-overwin-w)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"单行快速定位
"Plug 'unblevable/quick-scope'
"let g:qs_highlight_on_keys = ['f', 'b']

"多字节支持
Plug 'vim-scripts/FencView.vim'

Plug 'vim-scripts/auto_mkdir'

"Plug 'ShowMarks'

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
"Plug 'mbbill/undotree'

"nnoremap <leader>ut :UndotreeToggle<cr>
":nmap <c-x>u <ESC>:UndotreeToggle<CR>
":nmap <c-x>u <ESC>:UndotreeToggle<CR>
"if has("persistent_undo")
"    let udir = g:spx_home."/.vim/undodir/"
"    set undodir=udir
"
"    set undofile
"endif
"let g:undotree_WindowLayout = 2
"let g:undotree_SetFocusWhenToggle = 1

"Plug 'grep.vim'
":nmap <c-c>g <ESC>:Grep<CR>

"--------------------
" for c
"--------------------
Plug 'xvhfeng/c.vim'
"let g:C_GlobalTemplateFile	= 'usr/share/vim/vimfile/c-support/templates/Templates'
"let g:C_GlobalTemplateDir		= 'usr/share/vim/vimfile/c-support/templates'
let g:C_LocalTemplateFile		= g:spx_home.'/.vim/bundle/c.vim/c-support/templates/Templates'
let g:C_LocalTemplateDir		= g:spx_home.'/.vim/bundle/c.vim/c-support/templates'
map <c-x>c \cc
map <c-x>cc \co

Plug 'vim-scripts/CRefVim'
if !hasmapto('<Plug>CRV_CRefVimInvoke')
    map <silent> <unique> <Leader>ci <Plug>CRV_CRefVimInvoke
endif

Plug 'vim-scripts/a.vim'
if (!exists('g:alternateSearchPath'))
    let g:alternateSearchPath = 'sfr:./,sfr:include/,sfr:../,sfr:header/,sfr:../src,sfr:../include,sfr:../header'
endif

"设置c语言的header和c文件转换
:nmap <C-x>h <ESC>:w!<ESC>:A!<CR>

Plug 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = g:spx_home.'/.ycm_extra_conf.py'
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'

" 直接触发自动补全
let g:ycm_key_invoke_completion = '<c-x><c-o>'
let g:ycm_cache_omnifunc = 1
let g:ycm_auto_trigger = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
" let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
" let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
let g:ycm_collect_identifiers_from_tags_files = 1
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

"括号显示增强
Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0
au Syntax * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

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
" for python
"--------------------
"###### Python #########
"Plug 'klen/python-mode'

" python fly check, 弥补syntastic只能打开和保存才检查语法的不足
"Plug 'kevinw/pyflakes-vim'
let g:pyflakes_use_quickfix = 0

" for python.vim syntax highlight
"Plug 'hdima/python-syntax'
let python_highlight_all = 1

"Plug 'pyflakes/pyflakes'

" Plug 'mitechie/pyflakes-pathogen' " deprecated
"  Plug 'pyflakes.vim' " deprecated

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
"Plug 'evanmiller/nginx-vim-syntax'
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


"--------------------
" for shell
"--------------------
Plug 'lrvick/Conque-Shell'
let g:ConqueTerm_TERM ='xterm'
nmap <c-x>s :ConqueTerm bash<CR>

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

Plug 'Shougo/vimshell.vim'

"Plug 'jlanzarotta/bufexplorer'
":vmap <c-x>b <esc>:BufExplorer<cr>
":nmap <c-x>b <esc>:BufExplorer<cr>

Plug 'ervandew/supertab'

"搜索插件
"let g:ctrlsf_debug_mode = 1
"1. Search in a specific sub-directory
":CtrlSF {pattern} /path/to/dir
"2. Search case-insensitively
":CtrlSF -I {pattern}
"3. Search with regular expression
":CtrlSF -R {regex}
"4. Show result with specific context setting
":CtrlSF -A 3 -B 1 {pattern}
"5. Search in files with specific extension
":CtrlSF -G .*\.cpp {pattern}"
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

Plug 'scrooloose/nerdtree'
map <c-x><c-o> :NERDTreeToggle<CR>
 let NERDTreeIgnore=['\.d$[[dir]]', '\.o$[[file]]']

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"set shell=/bin/sh

call plug#end()
"call vundle#end()
filetype plugin indent on
filetype on
"filetype plugin indent on
