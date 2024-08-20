return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>x", function() harpoon:list():next() end)
        vim.keymap.set("n", "<leader>z", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<leader>c", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    end
}
