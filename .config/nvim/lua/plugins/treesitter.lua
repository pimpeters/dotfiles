-- nvim-treesitter main branch (rewritten for neovim 0.12+)
-- Install parsers (runs async, won't block startup)
require("nvim-treesitter").install({ "lua", "vim", "vimdoc", "query", "javascript", "html", "php", "vue", "yaml", "xml" })

-- Enable treesitter features via autocommand
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
