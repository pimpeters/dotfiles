vim.pack.add({
    -- Dependencies (load first)
    { src = 'https://github.com/nvim-lua/plenary.nvim', version = 'master' },

    -- Colorscheme
    'https://github.com/pimpeters/vim-persephone',

    -- Core plugins
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-context',
    { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
    'https://github.com/folke/snacks.nvim',
    'https://github.com/nvim-tree/nvim-tree.lua',

    -- Git
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/lewis6991/gitsigns.nvim',

    -- Copilot
    'https://github.com/github/copilot.vim',
    'https://github.com/CopilotC-Nvim/CopilotChat.nvim',

    -- LSP & Completion
    { src = 'https://github.com/VonHeikemen/lsp-zero.nvim', version = 'v4.x' },
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/williamboman/mason-lspconfig.nvim',
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
    { src = 'https://github.com/neovim/nvim-lspconfig', version = 'v2.5.0' },
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/saadparwaiz1/cmp_luasnip',
    'https://github.com/ray-x/lsp_signature.nvim',
    'https://github.com/nvimtools/none-ls.nvim',
}, { load = true })
