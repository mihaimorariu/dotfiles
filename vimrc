colorscheme badwolf

set nocompatible
set number
set encoding=utf-8
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set copyindent
set cindent
set laststatus=2
set list
set listchars=tab:›—,trail:␣,extends:▶,precedes:◀
set cinkeys=0{,0},0),o,O,!^F
set cino=g0,Ls,N-s,(s,U1,m1,j1,J1,#1,l1
set formatoptions+=j
set mouse=a
set nowrap
set colorcolumn=+1
set showcmd
set hlsearch
set nrformats=octal,hex,alpha
set updatetime=500
set timeoutlen=300
set ttimeoutlen=50
set foldmethod=marker
set history=200
set viminfo='100,s10,h,%
set guioptions=ac
set wildmenu
set nojoinspaces
let g:c_no_curly_error=1

nnoremap K i<Cr><Esc>
nmap <Leader>o VaBJds{
nmap <Leader>b i{<Cr><Esc>o}<Esc>k^
nnoremap <Leader>S vip:sort<Cr>
vnoremap <Leader>S :sort<Cr>gv
nnoremap <Leader>n :NERDTreeToggle<Cr>
nnoremap <Leader>f :NERDTreeFind<Cr>
noremap <MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>

syntax on
filetype off

call plug#begin('~/.vim/plugged')

let g:rust_recommended_style = 0
let g:python_recommended_style = 0

Plug 'vim-scripts/The-NERD-commenter'
Plug 'junegunn/vim-plug'
Plug 'Valloric/YouCompleteMe'
Plug 'godlygeek/tabular'
"Plug 'vim-scripts/surround.vim'
"Plug 'vim-scripts/repeat.vim'
"Plug 'vim-scripts/speeddating.vim'
"Plug 'vim-scripts/vis'
"Plug 'vim-scripts/Rename2'
"Plug 'vim-scripts/JSON.vim'
"Plug 'bkad/CamelCaseMotion'
"Plug 'guns/xterm-color-table.vim'
"Plug 'tpope/vim-fugitive'
"Plug 'Shougo/vimproc.vim'
"Plug 'vim-scripts/ShowMarks'

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

Plug 'vim-scripts/The-NERD-tree'
let NERDTreeQuitOnOpen = 1

"Plug 'ap/vim-buftabline'
nmap <C-Right> :bnext<CR>
nmap <C-Left> :bprev<CR>
nmap <C-l> :bnext<CR>
nmap <C-h> :bprev<CR>
nmap <C-d> :bd<CR>

Plug 'majutsushi/tagbar'
nmap <Leader>t :TagbarToggle<CR>

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_extensions = ['mixed', 'line']
let g:ctrlp_cmd = 'CtrlPMixed'

"Plug 'easymotion/vim-easymotion'
"let g:EasyMotion_keys = 'asghlqwertyuiopzxcvbnmdkfj'
"let g:EasyMotion_enter_jump_first = 1
"let g:EasyMotion_prompt = '{n}/'
"let g:EasyMotion_add_search_history = 0
"let g:EasyMotion_verbose = 0
"nmap s <Plug>(easymotion-s)
"nmap S <Plug>(easymotion-sn)
"
"Plug 'terryma/vim-multiple-cursors'
"let g:multi_cursor_exit_from_visual_mode = 0
"let g:multi_cursor_exit_from_insert_mode = 0
"
"Plug 'junegunn/vim-easy-align'
"xmap ga <Plug>(EasyAlign)
"nmap ga <Plug>(EasyAlign)
"let g:easy_align_delimiters = {
"	\ ',': { 'pattern': ',', 'left_margin': 0, 'right_margin': 1 },
"	\ '(': { 'pattern': '(', 'left_margin': 0, 'right_margin': 0 },
"	\ ')': { 'pattern': ')', 'left_margin': 0, 'right_margin': 0 } }
"
"let g:showmarks_enable=0
"let g:necoghc_enable_detailed_browse=1
"
"if has('python')
"	Plug 'vim-scripts/UltiSnips'
"	let g:UltiSnipsSnippetDirectories=["ultisnips"]
"	let g:UltiSnipsExpandTrigger="<c-space>"
"	xnoremap <silent> <tab> :call UltiSnips#SaveLastVisualSelection()<cr>gvs
"	let g:UltiSnipsJumpForwardTrigger="<tab>"
"	let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"
"	if v:version > 703
"		Plug 'Valloric/YouCompleteMe'
"		nnoremap <Leader>k <Esc>:YcmCompleter GoToDefinitionElseDeclaration<Cr>
"		nnoremap <Leader>i <Esc>:YcmCompleter FixIt<CR>:cclose<CR>
"		let g:ycm_key_list_select_completion = ['<Down>']
"		let g:ycm_key_list_previous_completion = ['<Up>']
"		let g:ycm_allow_changing_updatetime=0
"		set completeopt-=preview
"		let g:ycm_add_preview_to_completeopt=0
"		let g:ycm_global_ycm_extra_conf = '~/.vim/default_ycm_extra_conf.py'
"		let g:ycm_semantic_triggers={'haskell' : ['.']}
"	endif
"
"endif

call plug#end()

filetype plugin on
filetype indent on
autocmd FileType cmake setlocal noexpandtab
