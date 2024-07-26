filetype plugin indent on
syntax on

set autoindent
set autoread
set backspace=eol,start,indent
set encoding=utf8
set expandtab
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
set wrap
set grepprg=rg\ --vimgrep\ --follow

au! BufRead,BufNewFile *.pp setfiletype puppet
au BufRead,BufNewFile *.epp setl ft=epuppet
au BufRead,BufNewFile Puppetfile setfiletype ruby
silent! autocmd! filetypedetect BufRead,BufNewFile *.tf
autocmd BufRead,BufNewFile *.hcl,*.tfbackend set filetype=hcl
autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl
autocmd BufRead,BufNewFile *.tf,*.tfvars,*.tftest.hcl set filetype=terraform
autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json

autocmd FileType puppet setlocal tabstop=2 shiftwidth=2
autocmd FileType epuppet setlocal tabstop=2 shiftwidth=2

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

