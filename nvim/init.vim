"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------

call plug#begin()

Plug 'akinsho/bufferline.nvim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender.vim'
Plug 'liuchengxu/vista.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'shime/vim-livedown'

"Plug 'google/vim-codefmt'
"Plug 'google/vim-glaive'
"Plug 'google/vim-maktaba'
"Plug 'majutsushi/tagbar'
"Plug 'rhysd/vim-clang-format'
"Plug 'vim-scripts/The-NERD-commenter'

call plug#end()

lua <<EOF
require'bufferline'.setup {
    highlights = {
        buffer_selected = {
            gui = "bold"
        }
    }
}
require'dap-python'.setup('python')
require'dap-python'.test_runner = 'pytest'
require'nvim-tree'.setup()
require('nvim-treesitter.configs').setup {
    ensure_installed = "maintained",
    highlight = {enable = true},
    indent = {enable = true}
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
set nowrap
set number
set shiftwidth=4
set softtabstop=-1
set termguicolors

colorscheme tender

"------------------------------------------------------------------------------
" Plugin configuration
"------------------------------------------------------------------------------

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

" vista
let g:vista_icon_indent = ['╰─▸ ', '├─▸ ']
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {'cpp': 'vim_lsp', 'php': 'vim_lsp'}
let g:vista_ctags_cmd = {'haskell': 'hasktags -x -o - -c'}
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {"function": "\uf794", "variable": "\uf71b"}

"------------------------------------------------------------------------------
" Keybindings
"------------------------------------------------------------------------------

" nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" Livedown
nnoremap gm :LivedownToggle<CR>

" vista
nnoremap <C-v> :Vista!!<CR>

" nvim-dap-python
nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

" bufferline
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>
