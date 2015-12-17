"--------------基本设置----------------------
syntax on
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set clipboard+=unnamed
set foldlevel=99
set ruler
set showcmd
set number
set mouse=a
set hlsearch
"自动切换目录
set acd
set backspace=indent,eol,start
set autoindent " same level indent
set smartindent " next level indent
autocmd FileType python setlocal foldmethod=indent
autocmd FileType python setlocal et sta sw=4 sts=4
"重定义制表符shiftwidth（缩进的空格数）tabstop（制表符的宽度）
set shiftwidth=4
set tabstop=4



"----------------快捷键-----------------
"按kj 从insert模式切换到normal模式
inoremap kj <Esc>
"change word to uppercase
inoremap <C-u> <esc>gUiwea
set pastetoggle=<F12>
nmap <F2> <esc>:q<cr>
nmap <F3> <esc>:w<cr>
imap <F3> <esc>:w<cr>
imap <F2> <esc>:q<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"重定义<leader>
let mapleader = ','
let g:mapleader = ','
noremap H 0
noremap L $
"tag
map <F9> :!ctags -R<cr>
imap <F9> <esc>:ctags -R<cr>
autocmd FileType python nnoremap <buffer> <F5> :!python3 %<cr>

"----------------vundle 插件管理---------------
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'VundleVim/Vundle.vim'

"------主题 solarized
Bundle 'altercation/vim-colors-solarized'
"let g:solarized_termtrans=1
"set background=dark
set t_Co=256
colorscheme solarized
hi Normal ctermbg=232
hi LineNr ctermbg=233
hi CursorLine ctermbg=8
hi TabLine ctermbg=8
hi Pmenu ctermbg=11 ctermfg=00
hi PmenuSel ctermbg=00 ctermfg=10

"------浏览文件nerdtree
Bundle 'scrooloose/nerdtree'
map <leader>T :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeWinSize=20
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let NERDTreeShowBookmarks = 1
let NERDTreeCaseSensitiveSort = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
autocmd VimEnter * NERDTree
" let mouse in right side when start
wincmd w
autocmd VimEnter * wincmd w
autocmd vimenter * if !argc() | NERDTree | endif

"------taglist
Bundle 'vim-scripts/taglist.vim'
set tags=tags;/
let Tlist_Ctags_Cmd="/usr/bin/ctags"
nnoremap <leader>t :TlistToggle<CR>
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 0
let Tlist_WinWidth = 25
let Tlist_Use_Right_Window = 1

"------状态条
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'unicode'

"------括号匹配
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
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"------缩进提示
Bundle  'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

"------快速跳转
Bundle 'Lokaltog/vim-easymotion'

"------添加成对标号
Bundle 'tpope/vim-surround'

"------增强python语法高亮
Bundle 'python.vim'

"------自动补全括号
Bundle 'Townk/vim-autoclose'

"------快速添加注释
Bundle 'scrooloose/nerdcommenter'

"------python神器
Bundle 'klen/python-mode'
" " " [[            Jump on previous class or function (normal, visual,
" operator  modes)
" " " ]]            Jump on next class or function (normal, visual, operator
" modes)
" " " [M            Jump on previous class or method (normal, visual, operator
" modes)
" " " ]M            Jump on next class or method (normal, visual, operator
" modes)
" "aC                Select a class. Ex: vaC, daC, yaC, caC (normal, operator
" modes)
" "iC                Select inner class. Ex: viC, diC, yiC, ciC (normal,
" operator modes)
" "aM                Select a function or method. Ex: vaM, daM, yaM, caM
" (normal, operator modes)
" "iM                Select inner function or method. Ex: viM, diM, yiM, ciM
" (normal, operator modes)

let g:pymode_motion = 1
let g:pymode_rope = 0
"  K Show python docs
let g:pymode_doc = 1
let g:pymode_doc_key = '<S-k>'
" "Linting
 let g:pymode_lint = 1
 let g:pymode_lint_checker = "pyflakes,pep8,pep257 "
 let g:pymode_lint_ignore = "E226"
let g:pymode_lint_on_write = 1
 let g:pymode_lint_message = 0
" " Auto check on save
 let g:pymode_lint_write = 1
" " Support virtualenv
 let g:pymode_virtualenv = 1
" " Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind ='<F4>'
" run vim 
let g:pymode_run = 1
" " syntax highlighting
 let g:pymode_syntax = 1
 let g:pymode_syntax_all = 1
 let g:pymode_syntax_indent_errors = g:pymode_syntax_all
 let g:pymode_syntax_space_errors = g:pymode_syntax_all

"------自动插入模板
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'


filetype plugin indent on     " required!

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"-----You Complete Me
:Bundle 'Valloric/YouCompleteMe'
:Bundle 'othree/xml.vim'
:Bundle 'scrooloose/syntastic'

"-----python style formater
map <F12> :call FormartSrc()<CR>
"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi --one-line=keep-statements -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !pydent % > /dev/null 2>&1"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'html'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'htm'
        exec "!astyle --style=gnu --suffix=none %"
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc

