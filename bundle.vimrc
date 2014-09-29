"配置插件管理
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "vundle"

" 多语言语法检查
Bundle 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
highlight SyntasticErrorSign guifg=white guibg=black

Bundle 'genutils'

Bundle 'xvhfeng/c.vim'
map <c-x>c \cc
map <c-x>u \co

" Bundle 'The-NERD-Commenter'
Bundle 'ShowTrailingWhitespace'

Bundle 'EasyMotion'
let g:EasyMotion_leader_key = 'f'

Bundle 'FencView.vim'

Bundle 'auto_mkdir'

Bundle 'bufexplorer.zip'
:vmap <c-x>b <esc>:w!<esc>,be
:nmap <c-x>b <esc>:w!<esc>,be

Bundle 'CRefVim'
if !hasmapto('<Plug>CRV_CRefVimInvoke')
    map <silent> <unique> <Leader>ci <Plug>CRV_CRefVimInvoke
endif

Bundle 'DoxygenToolkit.vim'
let g:DoxygenToolkit_briefTag_pre="@Remark:"
let g:DoxygenToolkit_paramTag_pre="@Param:"
let g:DoxygenToolkit_returnTag="@Returns:"
map <c-x>f <ESC>:Dox<cr>

Bundle 'grep.vim'
:nmap <c-g> <ESC>:Grep<CR>

Bundle 'ShowMarks'
Bundle 'statusline.vim'

Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=1
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

Bundle 'Yggdroot/indentLine'
"config for indentLine
let g:indentLine_indentLevel = 7
let g:indentLine_enabled = 1
"hi Conceal ctermfg=red ctermbg=red
"let g:indentLine_char = '|'


Bundle 'a.vim'
"设置c语言的header和c文件转换
:nmap <C-x>h <ESC>:w!<ESC>:A!<CR>

Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 0
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


Bundle 'terryma/vim-expand-region'
map + <Plug>(expand_region_expand)
map _ <Plug>(expand_region_shrink)

Bundle 'tpope/vim-commentary'

" Snippets are separated from the engine. Add this if you want them:
Bundle 'honza/vim-snippets'
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
" 定义存放代码片段的文件夹 .vim/additional_snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
"let g:UltiSnipsSnippetDirectories=["additional_snippets", 'UltiSnips']
Bundle 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" 快速加入修改环绕字符
Bundle 'tpope/vim-surround'

" for repeat -> enhance surround.vim, . to repeat command
Bundle 'tpope/vim-repeat'

" 快速去行尾空格 [, + <Space>]
Bundle 'bronson/vim-trailing-whitespace'
map <leader>es :FixWhitespace<cr>

"括号显示增强
Bundle 'kien/rainbow_parentheses.vim'
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


"################### 显示增强-主题 ###################"

"主题 solarized
Bundle 'altercation/vim-colors-solarized'
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

"主题 molokai
Bundle 'tomasr/molokai'
"let g:molokai_original = 1

"###### Python #########
" python fly check, 弥补syntastic只能打开和保存才检查语法的不足
Bundle 'kevinw/pyflakes-vim'
let g:pyflakes_use_quickfix = 0

" for python.vim syntax highlight
Bundle 'hdima/python-syntax'
let python_highlight_all = 1


"###### Markdown #########
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1


"###### Jinja2 #########
Bundle 'Glench/Vim-Jinja2-Syntax'

"###### nginx #########
Bundle 'evanmiller/nginx-vim-syntax'

Bundle 'SQLComplete.vim'
let g:sql_type_default = 'mysql'
"SQLSetType mysql

"the markdown editer
Bundle 'plasticboy/vim-markdown'

"the properties file editor
Bundle 'kamichidu/vim-edit-properties'


"undo tree
Bundle 'mbbill/undotree'
nnoremap <F12> :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir='~/.vim/undodir/'
    set undofile
endif



"--------------------
" for php
"--------------------
Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'vim-scripts/PDV--phpDocumentor-for-Vim'
Bundle 'erikfercak/php-search-doc'
Bundle 'lucapette/vim-jquery-doc'

"--------------------
" for html, haml, sass
"--------------------
Bundle 'concise/vim-html5-fix'
Bundle 'tpope/vim-haml'
" 自动补全html/xml标签
Bundle 'docunext/closetag.vim'
let g:closetag_html_style=1

"--------------------
" for javascript
"--------------------
Bundle 'nono/jquery.vim'
"Bundle 'itspriddle/vim-jquery'
Bundle 'vim-scripts/JSON.vim'
Bundle "pangloss/vim-javascript"
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"


"Bundle 'lookupfile'
" lookup file with ignore case
"function! LookupFile_IgnoreCaseFunc(pattern)
"	let _tags = &tags
"	try
"		let &tags = eval(g:LookupFile_TagExpr)
"		let newpattern = '\c' . a:pattern
"		let tags = taglist(newpattern)
"	catch
"		echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
"		return ""
"	finally
"		let &tags = _tags
"	endtry
" Show the matches for what is typed so far.
"	let files = map(tags, 'v:val["filename"]')
"	return files
"endfunction

"let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

"let g:LookupFile_MinPatLength = 2
"let g:LookupFile_PreserveLastPattern = 0
"let g:LookupFile_PreservePatternHistory = 1
"let g:LookupFile_AlwaysAcceptFirst = 1
"let g:LookupFile_AllowNewFiles = 0
""if filereadable("./filenametags")
""let g:LookupFile_TagExpr = '"./filenametags"'
""endif
"nmap <silent> <leader>lf :LookupFile<cr>
"nmap <silent> <leader>lb :LUBufs<cr>
"nmap <silent> <leader>lw :LUWalk<cr>


"Bundle 'taglist.vim'
"let Tlist_Exit_OnlyWindow = 1
""taglist窗口是否出现在右边，默认是左边
"let Tlist_Use_Right_Window = 1
""是否在选择了taglist后自动关闭taglist窗口
"let Tlist_Close_On_Select = 0
""是否在打开了taglist的同时把焦点设置到taglist窗口
"let Tlist_GainFocus_On_ToggleOpen = 1
""当多个文件在taglist从显示的时候，只打开当前文件，折叠别的文件
"let Tlist_File_Fold_Auto_Close = 0
"let Tlist_Auto_Update = 1
""map <silent> <leader>tl :TlistToggle<cr>
"map <F8> <ESC>:TlistToggle<cr>

"Bundle 'vmark.vim--Visual-Bookmarking'

"Bundle 'The-NERD-tree'
"let NERDTreeWinPos = "left" "where NERD tree window is placed on the screen
"let NERDTreeWinSize = 30 "size of the NERD tree
"nmap <F7> <ESC>:NERDTreeToggle<RETURN>" Open and close the NERD_tree.vim separately


" 文件搜索
"Bundle 'kien/ctrlp.vim'
"let g:ctrlp_map = '<leader>p'
"let g:ctrlp_cmd = 'CtrlP'
"map <leader>f :CtrlPMRU<CR>
"""set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
"let g:ctrlp_custom_ignore = {
"    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
"    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
"    \ }
"\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
"let g:ctrlp_working_path_mode=0
"let g:ctrlp_match_window_bottom=1
"let g:ctrlp_max_height=15
"let g:ctrlp_match_window_reversed=0
"let g:ctrlp_mruf_max=500
"let g:ctrlp_follow_symlinks=1

"状态栏增强展示
" Bundle 'Lokaltog/vim-powerline'
"if want to use fancy,need to add font patch -> git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
"let g:Powerline_symbols = 'fancy'
" let g:Powerline_symbols = 'unicode'

"
" golang
" " Go
" We are using cespare's modification,
" which uses bradfitz's goimports instead of gofmt.
" With goimports, you can add missing imports automatically.
" To install goimport:
"   go get github.com/bradfitz/goimports
" Bundle 'cespare/vim-golang'
" To install godef:
"   go get code.google.com/p/rog-go/exp/cmd/godef
" Bundle 'dgryski/vim-godef'
" To install gocode:
"   go get github.com/nsf/gocode
" Bundle 'Blackrush/vim-gocode'

" Bundle 'bradfitz/goimports'
filetype on
