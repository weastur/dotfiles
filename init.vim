if &compatible
  set nocompatible
endif

set autoindent
set autoread
set cmdheight=1
set encoding=utf-8
set expandtab
set fileformat=unix
set hidden
set history=500
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set magic
set matchtime=2
set mouse=a 
set nobackup
set noerrorbells
set noswapfile
set novisualbell
set nowrap
set nowritebackup
set number
set ruler
set scrolloff=7
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildmenu

filetype indent on
filetype plugin on

colorscheme slate
syntax enable
command W w !sudo tee % > /dev/null

set rtp+=/opt/homebrew/opt/fzf

function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('tyru/open-browser.vim')
  call minpac#add('junegunn/fzf.vim')
endfunction

function! PackList(...)
  call PackInit()
  return join(sort(keys(minpac#getpluglist())), "\n")
endfunction

command! -nargs=1 -complete=custom,PackList
      \ PackOpenUrl call PackInit() | call openbrowser#open(
      \    minpac#getpluginfo(<q-args>).url)

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

let g:python3_host_prog = '/Users/weastur/.pyenv/versions/py3nvim/bin/python'

" FZF
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
