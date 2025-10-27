return {
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
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        lazy = false,
        dependencies = { 'williamboman/mason.nvim' },
        config = function()
            require('mason-tool-installer').setup({
                ensure_installed = {
                    -- Formatters and linters
                    "phpstan",
                    "shfmt",
                    "stylua",
                },
                auto_update = false,
                run_on_start = true,
                start_delay = 3000, -- 3 second delay to avoid race conditions
                debounce_hours = 5, -- only install once every 5 hours
            })
        end,
    },
    {
        'ray-x/lsp_signature.nvim',
        lazy = true,
        event = 'InsertEnter',
        config = function()
            require('lsp_signature').setup({
                hint_enable = false,
            })
        end
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
        tag = 'v2.4.0',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function()
            local lsp_zero = require('lsp-zero')

            local lsp_attach = function(client, bufnr)
                local opts = {buffer = bufnr}
            end

            lsp_zero.extend_lspconfig({
                sign_text = true,
                lsp_attach = lsp_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities()
            })

            require('mason-lspconfig').setup({
                ensure_installed = {
                    -- Language servers
                    "gopls",         -- Go
                    "intelephense",  -- PHP
                    "lua_ls",        -- Lua
                    "vimls",         -- Vim script
                },
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })
        end
    },
    {
        'nvimtools/none-ls.nvim',
        lazy = false,
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                temp_dir = "/tmp",
                sources = {
                    null_ls.builtins.formatting.sql_formatter,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.shfmt,
                    null_ls.builtins.diagnostics.phpstan,
                },
            })
            vim.keymap.set('n', '<leader>f', function()
                vim.lsp.buf.format({async = true})
            end, {desc = 'Format buffer'})
        end,
    }
}
