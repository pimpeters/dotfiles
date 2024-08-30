return {
    'tpope/vim-fugitive',
    config = function()
        vim.g.gitgutter_map_keys = 0

        vim.api.nvim_set_keymap('n', '<leader>Gs', ':Git<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>Gd', ':Git diff<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>Gb', ':Git blame<cr>', { noremap = true, silent = true })
    end
}
