-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

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
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = true,
    config = false,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        sources = {
          {name = 'nvim_lsp'},
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      -- lsp_attach is where you enable features that only work
      -- if there is a language server active in the file
      local lsp_attach = function(client, bufnr)
        local opts = {buffer = bufnr}

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
      end

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      })

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        }
      })
    end
  }
}
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

-- - PLUGIN SETTINGS -

-- airblade/vim-gitgutter
vim.g.gitgutter_preview_win_floating = 0
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
vim.api.nvim_set_keymap('n', '<leader>Gs', ':Git<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Gd', ':Git diff<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Gb', ':Git blame<cr>', { noremap = true, silent = true })

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
