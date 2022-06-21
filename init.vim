if &compatible
  set nocompatible
endif

set autoindent
set autoread
set cmdheight=1
set completeopt=menu,menuone,noselect
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
set wrap
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
set undodir=~/.local/nvim/undo
set undofile
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildmenu

fun! TrimWhitespace()
     let l:save = winsaveview()
     keeppatterns %s/\s\+$//e
     call winrestview(l:save)
endfun

augroup vimrc
    autocmd!
    autocmd BufWritePre /private/tmp/* setlocal noundofile
    autocmd BufWritePre * if !&binary && &ft !=# 'mail' && &ft !=# 'markdown'
                    \|   call TrimWhitespace()
                    \| endif
augroup END

filetype indent on
filetype plugin on

colorscheme desert
syntax enable
command W w !sudo tee % > /dev/null

function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('tyru/open-browser.vim')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('tpope/vim-projectionist')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('preservim/nerdtree')
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('github/copilot.vim')
  call minpac#add('editorconfig/editorconfig-vim')

  call minpac#add('neovim/nvim-lspconfig')
  call minpac#add('hrsh7th/cmp-nvim-lsp')
  call minpac#add('hrsh7th/cmp-buffer')
  call minpac#add('hrsh7th/cmp-path')
  call minpac#add('hrsh7th/cmp-git')
  call minpac#add('hrsh7th/cmp-cmdline')
  call minpac#add('hrsh7th/nvim-cmp')
  call minpac#add('SirVer/ultisnips')
  call minpac#add('quangnguyen30192/cmp-nvim-ultisnips')

  call minpac#add('hashivim/vim-terraform')
  call minpac#add('honza/vim-snippets')
  call minpac#add('dense-analysis/ale')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('vim-test/vim-test')
  call minpac#add('rodjek/vim-puppet')
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

let g:python3_host_prog = '/usr/bin/python3'

" FZF
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
let g:fzf_action = {'ctrl-s': 'split', 'ctrl-v': 'vsplit'}
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()
nnoremap <c-p> :Files<cr>

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusConcealBrackets = 1

" Copilot
let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'python': v:true,
      \ 'rust': v:true,
      \ 'go': v:true,
      \ 'sh': v:true,
      \ }

" Editor config
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Completion
lua <<EOF
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF

lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
    'bashls',
    'yamlls',
    'ansiblels',
    'solargraph',
    'gopls',
    'clangd',
    'pyright',
    'rust_analyzer',
    'terraform_lsp',
                }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
require('lspconfig').solargraph.setup{
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      solargraph = {
        diagnostics = true,
        completion = true
      }
    }
}

EOF

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" ALE
let g:ale_linters = {
    \ 'sh': ['shellcheck'],
    \ 'dockerfile': ['hadolint'],
    \ 'markdown': ['markdownlint'],
    \ 'yaml': ['yamllint'],
    \ 'puppet': ['puppet-lint'],
    \ 'terraform': ['tflint'],
    \ 'yaml.ansible': ['ansible-lint'],
    \ }
let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 0
let g:ale_completion_autoimport = 0
let g:ale_cursor_detail = 0
let g:ale_echo_cursor = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
set statusline=%<%f\ %{LinterStatus()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-d> <Plug>(ale_detail)

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "dispatch"
