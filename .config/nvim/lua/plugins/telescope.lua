return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set("n", '<leader>ft', function()
            require("telescope.builtin").tags({ only_sort_tags = true })
        end)

        vim.keymap.set('n', '<leader>fF', function()
            vim.ui.input({ prompt = "Enter directory: " }, function(input)
                if input then
                    require('telescope.builtin').find_files({ search_dirs = { input } })
                else
                    print("No input provided")
                end
            end)
        end)

        vim.keymap.set('n', '<leader>fG', function()
            vim.ui.input({ prompt = "Enter directory: " }, function(input)
                if input then
                    require('telescope.builtin').live_grep({ search_dirs = { input } })
                else
                    print("No input provided")
                end
            end)
        end)

        require('telescope').setup{
            pickers = {
                find_files = {
                    find_command = { 'rg', '-l', '\'.?\'',  '--iglob', '!.git', '--hidden' },
                },
                grep_string = {
                    file_ignore_patterns = { '.git' },
                },
                live_grep = {
                    file_ignore_patterns = { '.git' },
                }
            }
        }
    end
}
