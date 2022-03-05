"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------

call plug#begin()

Plug 'akinsho/bufferline.nvim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'google/vim-maktaba'
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mcchrish/nnn.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'numToStr/Comment.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'puremourning/vimspector'
Plug 'qpkorr/vim-bufkill'
Plug 'preservim/tagbar'
Plug 'rcarriga/vim-ultest', {'do': ':UpdateRemotePlugins'}
Plug 'shime/vim-livedown'
Plug 'vim-test/vim-test'

call plug#end()

lua <<EOF
require'bufferline'.setup {
    highlights = {
        buffer_selected = {
            gui = "bold"
        }
    }
}
require'Comment'.setup()
require('nvim-treesitter.configs').setup {
    ensure_installed = "maintained",
    highlight = {enable = true}
}
require'nvim-web-devicons'.setup()
EOF

"------------------------------------------------------------------------------
" General configuration
"------------------------------------------------------------------------------

syntax enable

set colorcolumn=80
set expandtab
set history=200
set list
set mouse=a
set noequalalways
set nowrap
set number
set shiftwidth=4
set softtabstop=-1
set termguicolors

colorscheme tender

"------------------------------------------------------------------------------
" Plugin configuration
"------------------------------------------------------------------------------

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'

" lightline
let g:lightline = {'colorscheme': 'tender'}

" nvim-tree 
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_root_folder_modifier = ':~'
let g:nvim_tree_add_trailing = 0
let g:nvim_tree_group_empty = 1
let g:nvim_tree_disable_window_picker = 1
let g:nvim_tree_icon_padding = ' '
let g:nvim_tree_symlink_arrow = ' >> '
let g:nvim_tree_respect_buf_cwd = 1
let g:nvim_tree_create_in_closed_folder = 0
let g:nvim_tree_window_picker_exclude = {
    \ 'filetype': ['notify', 'packer', 'qf'],
    \ 'buftype': ['terminal']
    \}
let g:nvim_tree_special_files = {
    \ 'README.md': 1,
    \ 'Makefile': 1,
    \ 'MAKEFILE': 1
    \}
let g:nvim_tree_show_icons = {
    \ 'git': 1, 
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0
    \}
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': '✗',
    \   'staged': '✓',
    \   'unmerged': '',
    \   'renamed': '➜',
    \   'untracked': '★',
    \   'deleted': '',
    \   'ignored': '◌'
    \  },
    \ 'folder': {
    \   'arrow_open': '',
    \   'arrow_closed': '',
    \   'default': '',
    \   'open': '',
    \   'empty': '',
    \   'empty_open': '',
    \   'symlink': '',
    \   'symlink_open': '',
    \  }
    \}

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" livedown
let g:livedown_autorun = 0
let g:livedown_open = 1
let g:livedown_port = 1337
let g:livedown_browser = 'firefox'

" tagbar
let g:tagbar_no_status_line = 1
let g:tagbar_autofocus = 1

" nnn
let g:nnn#layout = {'window': {'height': 0.5, 'width': 0.5, 'highlight': 'debug', 'border': 'sharp'}}

" vim-ultest
let test#python#pytest#options = "--color=yes"

"------------------------------------------------------------------------------
" Keybindings
"------------------------------------------------------------------------------

noremap <silent> <C-j> <C-x>
noremap <silent> <C-k> <C-a>

" nnn
map <silent> <C-n> :NnnPicker<CR>

" Livedown
noremap <silent> gm :LivedownToggle<CR>

" tagbar
map <silent> <C-t> :TagbarToggle<CR>

" bufferline
map <silent> <C-h> :BufferLineCyclePrev<CR>
map <silent> <C-l> :BufferLineCycleNext<CR>
map <silent> <C-x> :BD<cr>

" Window navigation
map <silent> <A-h> <C-w>h
map <silent> <A-j> <C-w>j
map <silent> <A-k> <C-w>k
map <silent> <A-l> <C-w>l
