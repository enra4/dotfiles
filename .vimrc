call plug#begin('~/.vim/plugged')

" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'liuchengxu/space-vim-dark'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'lervag/vimtex'
Plug '907th/vim-auto-save'
Plug 'sirver/ultisnips'

call plug#end()

set breakindent
set colorcolumn=80
set cursorline
set fillchars=vert:│,fold:-
set hidden
set incsearch
set laststatus=2
" set lazyredraw
set nocompatible
set noshowmode
set noswapfile
set number
set relativenumber
set scrolloff=9999
set shiftwidth=4
set showcmd
set smartindent
set tabstop=4
set updatetime=100
set wildmenu
set wildmode=list

colorscheme space-vim-dark
set termguicolors
hi Comment cterm=italic
hi LineNr ctermbg=NONE guibg=NONE
syntax on

let &t_ut=''

let g:lightline = {
\  'colorscheme': 'one',
\  'inactive': {
\    'left': [[], ['file', 'modified']],
\    'right': []
\  },
\  'active': {
\    'left': [['mode', 'paste'], ['file', 'modified'], ['buffers']],
\    'right': [['lineinfo'], ['percent'], ['readonly'],
\				['fileformat', 'fileencoding', 'filetype']]
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

let g:polyglot_disabled = ['latex']

" for vimtex
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
" let g:tex_conceal='abdmg'

" for auto-save
" only really used when i write latex
let g:auto_save = 0 " dont use global, use `:let b:auto_save = 1` instead
let g:auto_save_silent = 1
let g:auto_save_updatetime = 1000
" option below seems bugged but would be nice :$
" let g:auto_save_events = ['CursorHold', 'CursorHoldI']

" for snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" update statusline when dealing with buffers
autocmd BufAdd,BufDelete,BufWritePost,TextChanged,TextChangedI * call lightline#update()

" check to see to convert markdown -> pdf
autocmd InsertLeave,TextChanged * call Convertmd()

nmap <silent> <C-n> :NERDTreeToggle<CR>

nmap <silent> <C-x> :bd<CR>
nmap <silent> gB :bprev<CR>
nmap <silent> gb :bnext<CR>

nmap 1gb <Plug>lightline#bufferline#go(1)
nmap 2gb <Plug>lightline#bufferline#go(2)
nmap 3gb <Plug>lightline#bufferline#go(3)
nmap 4gb <Plug>lightline#bufferline#go(4)
nmap 5gb <Plug>lightline#bufferline#go(5)
nmap 6gb <Plug>lightline#bufferline#go(6)
nmap 7gb <Plug>lightline#bufferline#go(7)
nmap 8gb <Plug>lightline#bufferline#go(8)
nmap 9gb <Plug>lightline#bufferline#go(9)

" convert markdown to pdf if auto save is enabled
" assumes pandoc is installed
function! Convertmd()
	let extension = expand('%:e')
	if b:auto_save && extension == 'md'
		let filename = expand('%:t:r')
		let s = filename . '.md -f markdown -o ' . filename . '.pdf &'
		execute 'silent ! pandoc ' . s
	endif
endfunction
