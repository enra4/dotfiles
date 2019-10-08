call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

set breakindent
set cursorline
set fillchars=vert:│,fold:-
set hidden
set incsearch
set laststatus=2
set lazyredraw
set nocompatible
set noshowmode
set noswapfile
set number
set scrolloff=9999
set shiftwidth=4
set showcmd
set smartindent
set tabstop=4
set updatetime=100
set wildmenu
set wildmode=list

colorscheme dracula
let g:dracula_colorterm = 0

syntax on

let g:lightline = {
\  'colorscheme': 'deus',
\  'inactive': {
\    'left': [[], ['file', 'modified']],
\    'right': []
\  },
\  'active': {
\    'left': [['mode', 'paste'], ['file', 'modified'], ['buffers']],
\    'right': [['lineinfo'], ['percent'], ['readonly']]
\  },
\  'tabline': {
\    'left': [['tabs']],
\    'right': [['close']]
\  },
\  'component': {
\    'file': '%{expand("%")}'
\  },
\  'component_expand': {
\    'buffers': 'lightline#bufferline#buffers'
\  },
\  'component_type': {
\    'buffers': 'tabsel'
\  }
\}
let g:lightline#bufferline#show_number = 2

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" update statusline when dealing with buffers
autocmd BufAdd,BufDelete,BufWritePost,TextChanged,TextChangedI * call lightline#update()

nmap <C-n> :NERDTreeToggle<CR>

nmap <C-x> :bd<CR>
nmap gB :bprev<CR>
nmap gb :bnext<CR>

nmap 1gb <Plug>lightline#bufferline#go(1)
nmap 2gb <Plug>lightline#bufferline#go(2)
nmap 3gb <Plug>lightline#bufferline#go(3)
nmap 4gb <Plug>lightline#bufferline#go(4)
nmap 5gb <Plug>lightline#bufferline#go(5)
nmap 6gb <Plug>lightline#bufferline#go(6)
nmap 7gb <Plug>lightline#bufferline#go(7)
nmap 8gb <Plug>lightline#bufferline#go(8)
nmap 9gb <Plug>lightline#bufferline#go(9)
