require("CopilotChat").setup({})

vim.keymap.set("n", "<leader>oc", "<cmd>CopilotChat<cr>")
vim.keymap.set("n", "<leader>oo", "<cmd>CopilotChatOptimize<cr>")

-- Note: Run `make tiktoken` in the CopilotChat plugin directory after install:
-- cd ~/.local/share/nvim/site/pack/vendor/start/CopilotChat.nvim && make tiktoken
