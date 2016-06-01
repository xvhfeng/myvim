set nocompatible
"配置插件管理
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Plugin 'gmarik/Vundle.vim'

"--------------------
" for common
"--------------------
Plugin 'genutils'

Plugin 'vim-scripts/ZoomWin'


"Plugin 'jlanzarotta/bufexplorer'
":vmap <c-x>b <esc>:BufExplorer<cr>
":nmap <c-x>b <esc>:BufExplorer<cr>

Plugin 'trotter/autojump.vim'

Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=1
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

Plugin 'terryma/vim-expand-region'
map + <Plug>(expand_region_expand)
map _ <Plug>(expand_region_shrink)

" 快速加入修改环绕字符
Plugin 'tpope/vim-surround'

" for repeat -> enhance surround.vim, . to repeat command
Plugin 'tpope/vim-repeat'

" 快速去行尾空格 [, + <Space>]
Plugin 'bronson/vim-trailing-whitespace'
map <leader>es :FixWhitespace<cr>

Plugin 'EasyMotion'
let g:EasyMotion_leader_key = 'f'

Plugin 'FencView.vim'

Plugin 'auto_mkdir'

"Plugin 'ShowMarks'

Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 0
let g:airline_section_b = '%{strftime("%Y-%m-%d %T")}'

Plugin 'Yggdroot/indentLine'
"config for indentLine
let g:indentLine_indentLevel = 7
let g:indentLine_enabled = 1
"hi Conceal ctermfg=red ctermbg=red
"let g:indentLine_char = '|'

"undo tree
Plugin 'mbbill/undotree'
nnoremap <leader>ut :UndotreeToggle<cr>
:nmap <c-x>u <ESC>:UndotreeToggle<CR>
:nmap <c-x>u <ESC>:UndotreeToggle<CR>
if has("persistent_undo")
    set undodir='~/.vim/undodir/'
    set undofile
endif
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1

Plugin 'grep.vim'
:nmap <c-g> <ESC>:Grep<CR>



"--------------------
" for c
"--------------------
Plugin 'xvhfeng/c.vim'
"let g:C_GlobalTemplateFile	= 'usr/share/vim/vimfile/c-support/templates/Templates'
"let g:C_GlobalTemplateDir		= 'usr/share/vim/vimfile/c-support/templates'
let g:C_LocalTemplateFile		= '/Users/xuhaifeng/.vim/bundle/c.vim/c-support/templates/Templates'
let g:C_LocalTemplateDir		= '/Users/xuhaifeng/.vim/bundle/c.vim/c-support/templates'
map <c-x>c \cc
map <c-x>cc \co

Plugin 'CRefVim'
if !hasmapto('<Plug>CRV_CRefVimInvoke')
    map <silent> <unique> <Leader>ci <Plug>CRV_CRefVimInvoke
endif

Plugin 'a.vim'
if (!exists('g:alternateSearchPath'))
  let g:alternateSearchPath = 'sfr:./,sfr:include/,sfr:../,sfr:header/,sfr:../src,sfr:../include,sfr:../header'
endif

"设置c语言的header和c文件转换
:nmap <C-x>h <ESC>:w!<ESC>:A!<CR>

Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '/Users/xuhaifeng/.ycm_extra_conf.py'
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
Plugin 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
highlight SyntasticErrorSign guifg=white guibg=black

Plugin 'tpope/vim-commentary'

Plugin 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"括号显示增强
Plugin 'kien/rainbow_parentheses.vim'
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

" Plugin 'The-NERD-Commenter'
Plugin 'ShowTrailingWhitespace'

Plugin 'DoxygenToolkit.vim'
let g:DoxygenToolkit_briefTag_pre="@Remark:"
let g:DoxygenToolkit_paramTag_pre="@Param:"
let g:DoxygenToolkit_returnTag="@Returns:"
map <c-x><c-f> <ESC>:Dox<cr>


"--------------------
" for markdown
"--------------------

"###### Markdown #########
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1


"---------------------
"for ReST
"_____________________
Bundle 'Rykka/riv.vim'
Bundle 'Rykka/InstantRst'

"--------------------
" for python
"--------------------
"###### Python #########
"Plugin 'klen/python-mode'

" python fly check, 弥补syntastic只能打开和保存才检查语法的不足
Plugin 'kevinw/pyflakes-vim'
let g:pyflakes_use_quickfix = 0

" for python.vim syntax highlight
Plugin 'hdima/python-syntax'
let python_highlight_all = 1

"Plugin 'pyflakes/pyflakes'

" Plugin 'mitechie/pyflakes-pathogen' " deprecated
"  Plugin 'pyflakes.vim' " deprecated

"--------------------
" for subject
"--------------------
"主题 solarized
Plugin 'altercation/vim-colors-solarized'
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

"主题 molokai
Plugin 'tomasr/molokai'
"let g:molokai_original = 1

Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'kamichidu/vim-edit-properties'

"--------------------
" for javascript
"--------------------
Plugin 'nono/jquery.vim'
Plugin 'pangloss/vim-javascript'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"--------------------
" for php
"--------------------
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plugin 'erikfercak/php-search-doc'
Plugin 'lucapette/vim-jquery-doc'

"--------------------
" for html, haml, sass
"--------------------
Plugin 'tpope/vim-haml'
" 自动补全html/xml标签
Plugin 'docunext/closetag.vim'
let g:closetag_html_style=1

Plugin 'vim-scripts/JSON.vim'



"--------------------
" for database
"--------------------

Plugin 'SQLComplete.vim'
let g:sql_type_default = 'mysql'


"--------------------
" for shell
"--------------------
Plugin 'lrvick/Conque-Shell'
let g:ConqueTerm_TERM ='xterm'
nmap <c-x>s :ConqueTerm bash<CR>

Plugin 'Shougo/vimproc'
Plugin 'Shougo/unite.vim'
let g:unite_enable_split_vertically = 1
let g:unite_source_file_async_command = "ls -las"
  let g:unite_ignore_source_files = ['*.o']
let g:unite_source_history_yank_enable = 1
"nnoremap <Leader>p :Unite file_rec/async -auto-preview<cr>
nnoremap <c-x>/ :Unite grep:.<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>q :Unite -quick-match buffer<cr>
nnoremap <c-x>b :Unite buffer<cr>
nnoremap <space>a :UniteBookmarkAdd <cr>
nnoremap <space>c :Unite bookmark<CR>
"nnoremap <space>m :Unite file_mru<CR>

Plugin 'Shougo/vimfiler.vim'
let g:vimfiler_safe_mode_by_default = 0
nnoremap <c-x>f :VimFilerBufferDir<CR>

Plugin 'Shougo/unite-outline'
nnoremap <c-x>l :Unite outline<CR>

Plugin 'ervandew/supertab'


call vundle#end()
filetype plugin indent on
filetype on
"filetype plugin indent on
