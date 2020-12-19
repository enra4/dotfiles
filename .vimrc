let g:polyglot_disabled = ['latex']

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
Plug '907th/vim-auto-save'
Plug 'sirver/ultisnips'
Plug 'junegunn/goyo.vim'
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
set ttimeoutlen=50
set updatetime=100
set wildmenu
set wildmode=list

" colorscheme space-vim-dark
" colorscheme nebula
"
" hi Normal guibg=NONE ctermbg=NONE
" hi Comment cterm=italic
" hi LineNr ctermbg=NONE guibg=NONE
" highlight Normal guibg=#1b1617
" highlight CursorLine guibg=NONE
" highlight ColorColumn guibg=#231d1f

set background=dark
set termguicolors

syntax on
colorscheme yin

let &t_ut=''

let g:lightline = {
\  'colorscheme': 'seoul256',
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
\    'file': '%{expand("%")}',
\    'lineinfo': '%3l:%-2v%<'
\  },
\  'component_expand': {
\    'buffers': 'lightline#bufferline#buffers'
\  },
\  'component_type': {
\    'buffers': 'tabsel'
\  }
\}
let g:lightline#bufferline#show_number = 2

" for goyo, looks so much prettier without though...
let g:goyo_linenr=1

" for vimtex
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

" disable beeping, both bell and window flashing
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" https://vi.stackexchange.com/questions/12009/how-do-i-keep-accidentally-creating-a-no-break-space-before-opening-curly-brace
augroup FixNoBreakSpaces
  autocmd!
  autocmd BufWritePre * silent! :%s/\%u00A0/ /g
augroup end

" update statusline when dealing with buffers
autocmd BufAdd,BufDelete,BufWritePost,TextChanged,TextChangedI * call lightline#update()

" default
autocmd BufNewFile,BufRead * let b:auto_save = 0

" buffers
nmap <silent> <C-x> :bp\|bd # <bar> call lightline#update()<CR>
nmap <silent> gB :bprev<CR>
nmap <silent> gb :bnext<CR>

" lol
nmap 1gb <Plug>lightline#bufferline#go(1)
nmap 2gb <Plug>lightline#bufferline#go(2)
nmap 3gb <Plug>lightline#bufferline#go(3)
nmap 4gb <Plug>lightline#bufferline#go(4)
nmap 5gb <Plug>lightline#bufferline#go(5)
nmap 6gb <Plug>lightline#bufferline#go(6)
nmap 7gb <Plug>lightline#bufferline#go(7)
nmap 8gb <Plug>lightline#bufferline#go(8)
nmap 9gb <Plug>lightline#bufferline#go(9)

" plugins
nmap <silent> <Leader>t :Files<CR>
nmap <silent> <Leader>f :GFiles<CR>
nmap <silent> <Leader>b :Buffers<CR>
nmap <silent> <Leader>g :Goyo<CR>
