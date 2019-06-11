call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'

call plug#end()

set breakindent
set cursorline
set fillchars=vert:│,fold:-
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
\    'left': [['mode', 'paste'], ['file', 'modified']],
\    'right': [['lineinfo'], ['percent'], ['readonly']]
\  },
\  'tabline': {
\  'left': [ [ 'tabs' ] ],
\  'right': [ [ 'close' ] ]
\  },
\  'component': {
\    'file': '%{expand("%")}'
\  }
\}
