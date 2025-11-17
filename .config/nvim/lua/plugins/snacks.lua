return {
    "folke/snacks.nvim",
    opts = {
        picker = { enabled = true, hidden = true, theme = "none" },
    },
    -- stylua: ignore
    keys = {
        { "<leader>ff", function() Snacks.picker.files({ hidden = true }) end },
        { "<leader>fF", function()
            vim.ui.input({ prompt = "Folder to search: " }, function(folder)
                if folder and #folder > 0 then
                    local root = vim.fn.getcwd()
                    local target = root .. "/" .. folder
                    Snacks.picker.files({ cwd = target })
                end
            end)
        end },
        { "<leader>fg", function() Snacks.picker.grep() end },
        { "<leader>fG", function()
            vim.ui.input({ prompt = "Folder to search: " }, function(folder)
                if folder and #folder > 0 then
                    local root = vim.fn.getcwd()
                    local target = root .. "/" .. folder
                    Snacks.picker.grep({ cwd = target })
                end
            end)
        end },
        { "<leader>fb", function() Snacks.picker.buffers() end },
        { "<leader>fr", function() Snacks.picker.recent() end },
        { "<leader>fm", function() Snacks.picker.marks() end },
        { "<leader>fe", function() Snacks.picker.diagnostics_buffer() end },
        { "<leader>fx", function() Snacks.picker.highlights({pattern = "hl_group:^Snacks"}) end },
    },
    config = function ()
         vim.api.nvim_set_hl(0, "SnacksPicker", { bg="#000000", fg="#FFFFFF" })
    end
}
