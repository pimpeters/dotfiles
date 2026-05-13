-- Mason (must be set up first)
require("mason").setup()

require("mason-tool-installer").setup({
    ensure_installed = {
        "phpstan",
        "shfmt",
        "stylua",
    },
    auto_update = false,
    run_on_start = true,
    start_delay = 3000,
    debounce_hours = 5,
})

-- LSP Signature
require("lsp_signature").setup({
    hint_enable = false,
})

-- Autocompletion
local cmp = require("cmp")
cmp.setup({
    sources = {
        { name = "nvim_lsp" },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
    }),
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
})

-- LSP Configuration
local lsp_zero = require("lsp-zero")

local lsp_attach = function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
    callback = function(event)
        lsp_attach(nil, event.buf)
    end,
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "gopls",
        "intelephense",
        "lua_ls",
        "vimls",
        "vue_ls",
        "ts_ls",
    },
    automatic_installation = true,
    handlers = {
        function(server_name)
            if server_name == "ts_ls" or server_name == "vue_ls" then
                return
            end
            require("lspconfig")[server_name].setup({})
        end,
    },
})

-- Vue and TypeScript configuration
local vue_language_server_path = vim.fn.expand("$MASON/packages")
    .. "/vue-language-server"
    .. "/node_modules/@vue/language-server"
local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
local vue_plugin = {
    name = "@vue/typescript-plugin",
    location = vue_language_server_path,
    languages = { "vue" },
    configNamespace = "typescript",
}
local ts_ls_config = {
    init_options = {
        plugins = {
            vue_plugin,
        },
    },
    filetypes = tsserver_filetypes,
}
local vue_ls_config = {}

vim.lsp.config("vue_ls", vue_ls_config)
vim.lsp.config("ts_ls", ts_ls_config)
vim.lsp.enable({ "ts_ls", "vue_ls" })

-- Gdscript LSP (uses new vim.lsp API)
vim.lsp.config("gdscript", {
    cmd = { "nc", "localhost", "6005" },
    root_markers = { "project.godot" },
})
vim.lsp.enable("gdscript")

-- None-ls (null-ls)
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

vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })
