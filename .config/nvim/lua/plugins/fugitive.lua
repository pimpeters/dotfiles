return {
    'tpope/vim-fugitive',
    config = function()
        vim.g.gitgutter_map_keys = 0

        vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>gd', ':Git diff<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<cr>', { noremap = true, silent = true })
    end
}
