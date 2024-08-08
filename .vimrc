filetype plugin indent on
syntax on

set autoindent
set autoread
set backspace=eol,start,indent
set encoding=utf8
set expandtab
set grepprg=grep\ -iHn\ --binary-files=without-match\ --exclude-dir=.git
set hidden
set history=1024
set hlsearch
set ignorecase
set laststatus=2
set linebreak
set magic
set nobackup
set nocompatible
set noerrorbells
set noswapfile
set novisualbell
set nowrap
set nowritebackup
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set smarttab
set statusline=\ %F%y%m%r%h\ %w\ \ CWD:\ %{getcwd()}\ \ \ Line:\ %l/%L\ \ Column:\ %c
set tabstop=4
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildmenu
set wildmode=longest:full
set wildoptions=pum

autocmd QuickFixCmdPost *grep* cwindow

let mapleader = ","
let g:mapleader = ","

autocmd BufWritePre * :call CleanExtraSpaces()

fun! CleanExtraSpaces()
    if &ft =~ 'markdown\|html'
        return
    endif
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
