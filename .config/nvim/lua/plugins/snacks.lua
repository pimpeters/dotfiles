require("snacks").setup({
    picker = { enabled = true, hidden = true, theme = "none" },
})

vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "#000000", fg = "#FFFFFF" })

vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files({ hidden = true }) end)
vim.keymap.set("n", "<leader>fF", function()
    vim.ui.input({ prompt = "Folder to search: " }, function(folder)
        if folder and #folder > 0 then
            local root = vim.fn.getcwd()
            local target = root .. "/" .. folder
            Snacks.picker.files({ cwd = target })
        end
    end)
end)
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep() end)
vim.keymap.set("n", "<leader>fG", function()
    vim.ui.input({ prompt = "Folder to search: " }, function(folder)
        if folder and #folder > 0 then
            local root = vim.fn.getcwd()
            local target = root .. "/" .. folder
            Snacks.picker.grep({ cwd = target })
        end
    end)
end)
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end)
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end)
vim.keymap.set("n", "<leader>fm", function() Snacks.picker.marks() end)
vim.keymap.set("n", "<leader>fe", function() Snacks.picker.diagnostics_buffer() end)
vim.keymap.set("n", "<leader>fs", function() Snacks.picker.lsp_symbols() end)
