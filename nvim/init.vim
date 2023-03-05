"==============================================================================
" Plugin definition
"==============================================================================

call plug#begin()

" Code formatter
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'google/vim-maktaba'

" Markdown previews 
Plug 'shime/vim-livedown'

" Code comments creator
Plug 'numToStr/Comment.nvim'

" Docstring creator
Plug 'danymat/neogen'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Text alignment
Plug 'godlygeek/tabular'

" File icons
Plug 'kyazdani42/nvim-web-devicons'

" Status line
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Colorschemes
Plug 'ellisonleao/gruvbox.nvim'
Plug 'srcery-colors/srcery-vim'

" Treesitter-based code highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Symbols outline
Plug 'stevearc/aerial.nvim'

" Fuzzy file finder with preview window
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.1'}

" File browser
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Debugging adapter and user interface
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'

" LSP client (for symbols outline)
Plug 'neovim/nvim-lspconfig'

call plug#end()

"==============================================================================
" General configuration
"==============================================================================

syntax on

set background=dark
set colorcolumn=80
set expandtab
set history=200
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list
set mouse=a
set noequalalways
set nowrap
set number
set shiftwidth=4
set showtabline=2
set softtabstop=-1
set syntax=whitespace
set termguicolors

colorscheme srcery

"==============================================================================
" Plugin initialization
"==============================================================================

lua <<EOF

require('aerial').setup({
    layout = {
        min_width = {30, 0.1},
    },
    open_automatic = true,
})
require('Comment').setup()
require('dap-python').setup()
require('dapui').setup()
require('lspconfig').pyright.setup{}
require('neogen').setup {
    enabled = true,
    input_after_comment = true,
}
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'bash',
        'c',
        'cpp',
        'cuda',
        'python',
        'vim',
    },
    highlight = {
        enable = true,
    }
}
require('nvim-web-devicons').setup()
require('telescope').setup({
    extensions = {
        aerial = {
            show_nesting = {
                ['_'] = false,
                json = true,
                yaml = true,
            },
        },
    },
})
require('telescope').load_extension('aerial')
require('telescope').load_extension('file_browser')

EOF

"==============================================================================
" Plugin configuration
"==============================================================================

lua <<EOF

-------------------------------------------------------------------------------
-- lightline
-------------------------------------------------------------------------------
vim.g['lightline'] = {
    colorscheme = 'srcery',
    active = {
        left = {
            {'mode', 'paste'},
            {'readonly', 'filename', 'modified'},
        }
    },
    tabline = {
        left = {
            {'buffers'},
        },
        right = {
            {'close'},
        }
    },
    component_expand = {
        buffers = 'lightline#bufferline#buffers',
    },
    component_raw = {
        buffers = 1,
    },
    component_type = {
        buffers = 'tabsel',
    },
}

-------------------------------------------------------------------------------
-- nvim-dap/nvim-dap-ui
-------------------------------------------------------------------------------
local dap   = require('dap')
local dapui = require('dapui')

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

vim.fn.sign_define('DapBreakpoint', {
    text   = '🟥',
    texthl = '',
    linehl = '',
    numhl  = '',
})
vim.fn.sign_define('DapStopped', {
    text   = '▶️',
    texthl = '',
    linehl = '',
    numhl  = '',
})

-- vim-livedown
vim.g['livedown_autorun'] = 0
vim.g['livedown_browser'] = 'firefox'
vim.g['livedown_open']    = 1
vim.g['livedown_port']    = 1337

-- tagbar
vim.g['tagbar_no_status_line'] = 1
vim.g['tagbar_autofocus']      = 1
vim.g['tagbar_autopreview']    = 1

-------------------------------------------------------------------------------
-- coc
-------------------------------------------------------------------------------

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = 'yes'

EOF

"==============================================================================
" Keybindings
"==============================================================================

lua <<EOF

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local keyset = vim.keymap.set
local opts = {
    silent           = true,
    noremap          = true,
    expr             = true,
    replace_keycodes = false,
}

-------------------------------------------------------------------------------
-- aerial
-------------------------------------------------------------------------------
keyset('n', '<leader>a', ':AerialToggle<CR>')

-------------------------------------------------------------------------------
-- nvim-dap-ui
-------------------------------------------------------------------------------
keyset('n', '<F5>',      require('dap').continue)
keyset('n', '<F6>',      require('dap').terminate)
keyset('n', '<F10>',     require('dap').step_over)
keyset('n', '<F11>',     require('dap').step_into)
keyset('n', '<F12>',     require('dap').step_out)
keyset('n', '<leader>b', require('dap').toggle_breakpoint)

-------------------------------------------------------------------------------
-- telescope-file-browser
-------------------------------------------------------------------------------
keyset(
    'n',
    '<space>fb',
    ':Telescope file_browser path=%:p:h select_buffer=true<CR>'
)

-------------------------------------------------------------------------------
-- telescope
-------------------------------------------------------------------------------
keyset('n', '<leader>fa', ':Telescope aerial<CR>')
keyset('n', '<leader>ff', ':Telescope find_files<CR>')
keyset('n', '<leader>fg', ':Telescope live_grep<CR>')
keyset('n', '<leader>fb', ':Telescope buffers<CR>')
keyset('n', '<leader>fh', ':Telescope help_tags<CR>')

-------------------------------------------------------------------------------
-- vim-livedown
-------------------------------------------------------------------------------
keyset('n', '<leader>l', ':LivedownToggle<CR>')
keyset('n', '<leader>l', ':LivedownToggle<CR>')

-------------------------------------------------------------------------------
-- neogen
-------------------------------------------------------------------------------
keyset('n', '<leader>d', ':Neogen<CR>')

-------------------------------------------------------------------------------
-- coc
-------------------------------------------------------------------------------

keyset(
    'i',
    '<TAB>',
    'coc#pum#visible() ? coc#pum#next(1) : ' ..
    'v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
    opts
)
keyset(
    'i',
    '<S-TAB>',
    [[coc#pum#visible() ? coc#pum#prev(1) : '\<C-h>']],
    opts
)

EOF
