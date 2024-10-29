return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fF', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ft', builtin.tags, {})

        require('telescope').setup{
            pickers = {
                find_files = {
                    find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
                },
                grep_string = {
                    additional_args = {'--hidden'},
                    file_ignore_patterns = { '.git' },
                },
                live_grep = {
                    additional_args = {'--hidden'},
                    file_ignore_patterns = { '.git' },
                }
            }
        }
    end
}
