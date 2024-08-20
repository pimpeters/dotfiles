-- Add lazy.nvim to runtime path
vim.opt.runtimepath:append("~/.local/share/nvim/lazy/lazy.nvim")

-- Initialize lazy.nvim
require('lazy').setup({
  -- Shows Vim diff inline
  'airblade/vim-gitgutter',

  -- Git functions wrapper
  'tpope/vim-fugitive',

  -- Colorscheme
  'pimpeters/vim-persephone',

  -- Range, pattern and substitute preview
  'markonm/traces.vim',

  -- Github Copilot
  'github/copilot.vim',

  -- Treeview of current dir
  'scrooloose/nerdtree',

  -- Fuzzy finder for files
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Harpoon
  { "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Treesitter
  {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {"lua", "vim", "vimdoc", "query", "javascript", "html", "php", "vue", "yaml", "xml" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
          })
      end
  },

  -- Treesitter context
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("treesitter-context").setup({
            enable = true, -- Enable this plugin (can be false to disable)
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers = true, -- Show line numbers in the context window
            multiline_threshold = 20, -- Maximum number of lines to show for a single context
            trim_scope = "outer", -- Which context to trim. "outer", "inner", or "both"
            mode = "cursor",  -- Line used to calculate context. Choices: 'cursor', 'topline'
            separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
        })
    end,
  },

  -- LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").intelephense.setup({})
        end
    },
})

-- - SETTINGS -

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Use system clipboard
vim.opt.clipboard = 'unnamed'

-- Apply colorscheme
vim.cmd('colorscheme persephone')

-- Disable swap files
vim.opt.swapfile = false

-- Each tab is 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Relative linenumber and current line number
vim.opt.relativenumber = true
vim.opt.number = true

-- More natural feelings when opening splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Prevent wrapping of lines
vim.opt.wrap = false

-- Enable 256 colors
vim.opt.termguicolors = false

-- Search while typing
vim.opt.incsearch = true

-- Strip whitespace on save
vim.cmd('autocmd BufWritePre * :%s/\\s\\+$//e')

-- Marker at 80
vim.opt.colorcolumn = '80'

-- - PLUGIN SETTINGS -

-- airblade/vim-gitgutter
vim.cmd('autocmd BufWritePost * GitGutter')

-- scrooloose/nerdtree
vim.g.NERDTreeShowHidden = 1

-- - KEYBINDS -

-- Remap leader to comma
vim.g.mapleader = ','

vim.api.nvim_set_keymap('n', '<Leader>/', ':nohlsearch<cr>', { noremap = true, silent = true })

-- airblade/vim-gitgutter keybindings
vim.api.nvim_set_keymap('n', '<Leader>]', '<Plug>(GitGutterNextHunk)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>[', '<Plug>(GitGutterPrevHunk)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>=', '<Plug>(GitGutterPreviewHunk)', { noremap = true, silent = true })

-- tpope/vim-fugitive keybindings
vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gd', ':Git diff<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<cr>', { noremap = true, silent = true })

-- scrooloose/nerdtree keybindings
vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeToggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeToggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>m', ':NERDTreeFind<cr>', { noremap = true, silent = true })

-- nvim-telescope/telescope.nvim keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fF', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>ft', builtin.tags, {})

-- ThePrimeagen/harpoon keybindings
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>x", function() harpoon:list():next() end)
vim.keymap.set("n", "<leader>z", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>c", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- neovim/nvim-lspconfig keybindings
local lspconfig = require("lspconfig")
local get_intelephense_license = function ()
    local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
    local content = f:read("*a")
    f:close()
    return string.gsub(content, "%s+", "")
end
lspconfig.intelephense.setup({
    init_options = {
        licenceKey = get_intelephense_license()
    },
    on_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    end
})
