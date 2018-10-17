colorscheme badwolf

set autoindent
set cindent
set cinkeys=0{,0},0),o,O,!^F
set cino=g0,Ls,N-s,(s,U1,m1,j1,J1,#1,l1
set colorcolumn=80
set copyindent
set encoding=utf-8
set foldmethod=marker
set formatoptions+=j
set guioptions=ac
set history=200
set hlsearch
set laststatus=2
set list
set listchars=tab:›—,trail:␣,extends:▶,precedes:◀
set mouse=a
set nocompatible
set nojoinspaces
set nowrap
set nrformats=octal,hex,alpha
set number
set shiftwidth=4
set showcmd
set softtabstop=4
set tabstop=4
set termguicolors
set timeoutlen=300
set ttimeoutlen=50
set updatetime=500
set viminfo='100,s10,h,%
set wildmenu

nnoremap <Leader>s vip:sort<Cr>
vnoremap <Leader>s :sort<Cr>gv
noremap <Leader>n :NERDTreeToggle<Cr>
noremap <C-Left> :bprev<CR>
noremap <C-Right> :bnext<CR>
noremap <C-d> :bd<CR>

syntax on
filetype off

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'godlygeek/tabular'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'junegunn/vim-plug'
Plug 'vim-scripts/The-NERD-commenter'

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='powerlineish'

Plug 'vim-scripts/The-NERD-tree'
let NERDTreeQuitOnOpen = 1

Plug 'majutsushi/tagbar'
nmap <Leader>t :TagbarToggle<CR>

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_extensions = ['mixed', 'line']

Plug 'shime/vim-livedown'
let g:livedown_autorun = 0
let g:livedown_open = 1
let g:livedown_port = 1337
let g:livedown_browser = "chromium"

call plug#end()

filetype plugin on
filetype indent on
autocmd FileType cmake setlocal noexpandtab
