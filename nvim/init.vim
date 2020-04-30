"------------------------------------------------------------------------------
" Global configuration
"------------------------------------------------------------------------------

colorscheme badwolf

set autoindent
set backspace=indent,eol,start
set cindent
set cinkeys=0{,0},0),o,O,!^F
set cino=g0,Ls,N-s,(s,U1,m1,j1,J1,#1,l1
set colorcolumn=80
set copyindent
set encoding=utf-8
set expandtab
set foldmethod=marker
set formatoptions+=j
set formatprg=fmt\ -w80\ -g80
set guioptions=ac
set history=200
set hlsearch
set laststatus=2
set list
set listchars=tab:▶‒,trail:·,extends:▶,precedes:◀
set mouse=a
set nojoinspaces
set nowrap
set nrformats=octal,hex,alpha
set number
set shiftwidth=4
set showcmd
set softtabstop=2
set tabstop=2
set termguicolors
set timeoutlen=300
set ttimeoutlen=50
set updatetime=500
set viminfo='100,s10,h,%
set wildmenu

"------------------------------------------------------------------------------
" Installed plugins
"------------------------------------------------------------------------------

call plug#begin()

Plug 'christoomey/vim-titlecase'
Plug 'godlygeek/tabular'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'google/vim-maktaba'
Plug 'junegunn/vim-plug'
Plug 'majutsushi/tagbar'
Plug 'rhysd/vim-clang-format'
Plug 'vim-scripts/The-NERD-commenter'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/The-NERD-tree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'shime/vim-livedown'
Plug 'puremourning/vimspector'

call plug#end()

"------------------------------------------------------------------------------
" Plugin configuration
"------------------------------------------------------------------------------

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" vim-airline
let g:airline_theme = 'molokai'

" NERDTree
let NERDTreeQuitOnOpen = 1

" ctrlp
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_extensions = ['mixed', 'line']

" livedown
let g:livedown_autorun = 0
let g:livedown_open = 1
let g:livedown_port = 1337
let g:livedown_browser = "chromium-browser"

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'
sign define vimspectorBP text=🔴 texthl=Normal
sign define vimspectorBPDisabled text=🔵 texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

syntax on
filetype off
filetype plugin on
filetype indent on

"------------------------------------------------------------------------------
" Keybindings
"------------------------------------------------------------------------------

noremap <Leader>s vip:sort<Cr>
noremap <Leader>s :sort<Cr>gv
noremap <S-h> :bprev<CR>
noremap <S-l> :bnext<CR>
noremap D :bp<bar>sp<bar>bn<bar>bd<CR>
noremap <Leader>t :TagbarToggle<CR>
noremap <Leader>n :NERDTreeToggle<Cr>

noremap <F2> :TNext<CR>
noremap <F3> :TStep<CR>
noremap <F5> :TContinue<CR>
noremap <F6> :TFinish<CR>
noremap <F10> :TToggleBreak<CR>
noremap <F12> :TLocateCursor<CR>

"------------------------------------------------------------------------------
" File type configuration
"------------------------------------------------------------------------------

autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType cuda set ft=c

"------------------------------------------------------------------------------
" Code format
"------------------------------------------------------------------------------

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
