return {
    'airblade/vim-gitgutter',
    config = function()
        vim.g.gitgutter_preview_win_floating = 0
        vim.cmd('autocmd BufWritePost * GitGutter')

        vim.api.nvim_set_keymap('n', '<Leader>]', '<Plug>(GitGutterNextHunk)', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>[', '<Plug>(GitGutterPrevHunk)', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>=', '<Plug>(GitGutterPreviewHunk)', { noremap = true, silent = true })
    end
}
