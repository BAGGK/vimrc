" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
set smartcase		" Do smart case matching
"set incsearch		" Incremental search

" 显示行号
set number

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" 自动缩进
set autoindent
set cindent

" Tab键的宽度
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

"自动保存
set autowrite

set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏

"搜索忽略大小写
set ignorecase

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

"C，C++ 按F5编译运行
""map <F5> :call CompileRunGcc()<CR>
""func! CompileRunGcc()
""    exec "w"
""    if &filetype == 'c'
""        exec "!g++ % -o %<"
""        exec "! ./%<"
""    elseif &filetype == 'cpp'
""        exec "!g++ % -o %<"
""        exec "! ./%<"
""    elseif &filetype == 'java' 
""        exec "!javac %" 
""        exec "!java %<"
""    elseif &filetype == 'sh'
""        :!./%
""	endif
""endfunc

 "C,C++的调试
""map <F8> :call Rungdb()<CR>
""func! Rungdb()
""    exec "w"
""    exec "!g++ % -g -o %<"
""    exec "!gdb ./%<"
""endfunc

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
"":inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key"

" 显示中文帮助
if version >= 603
     set helplang=cn
     set encoding=utf-8
endif"

"允许插件  
filetype plugin on"

"使用某种背景设置
colorscheme molokai

"不要用空格代替制表符
set noexpandtab

"映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G" 

 "禁止生成临时文件
set nobackup
set noswapfile"

"Vundle"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
"NERdTree的配置{
	map <F3> :NERDTreeToggle<CR>
	map <C-F3> :NERDTreeFind<CR>
	let NERDTreeChDirMode=2 "选中root即设置为当前目录"
	let NERDTreeQuitOnOpen=1 "打开文件时关闭树
	let NERDTreeShowBookmarks=1 "显示书签
    let NERDTreeMinimalUI=1 "不显示帮助面板
	let NERDTreeDirArrows=1 "目录箭头 1 显示箭头 0传统+-|号i
	let NERDTreeWinPos = "right"	
"}

Bundle 'majutsushi/tagbar'
"majutsushi/tagbar的配置{
	let g:tagbar_width=35
	let g:tagbar_left=1
	map <F2> :TagbarToggle<CR>
	map! <F2> <Esc>:TagbarToggle<CR>
	autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"}

Bundle 'Rip-Rip/clang_complete'
"'Rip-Rip/clang_complete的配置{
	let g:clang_complete_copen=1
	let g:clang_periodic_quickfix=1
	let g:clang_snippets=1
	let g:clang_close_preview=1
	let g:clang_use_library=1
	let g:clang_library_path='/usr/lib/llvm-3.8/lib'
	let g:neocomplcache_enable_at_startup = 1
"}

Bundle 'Lokaltog/vim-powerline'
"Lokaltog/vim-powerline的配置{
"}

Bundle 'rking/ag.vim'
"rking/ag.vim的配置{
"}

"QuickFix的配置{
"}

Bundle 'winmanager'
"'winmanager'的配置{
"}

Bundle 'scrooloose/syntastic'
"Plugin 'scrooloose/syntastic'{
"}
