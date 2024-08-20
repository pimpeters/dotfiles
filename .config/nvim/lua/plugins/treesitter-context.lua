return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("treesitter-context").setup({
            enable = true, -- Enable this plugin (can be false to disable)
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers = true, -- Show line numbers in the context window
            multiline_threshold = 20, -- Maximum number of lines to show for a single context
            trim_scope = "outer", -- Which context to trim. "outer", "inner", or "both"
            mode = "cursor",  -- Line used to calculate context. Choices: 'cursor', 'topline'
            separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
        })
    end,
}
