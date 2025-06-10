return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  opts = {},
  keys = {
    { "<leader>oo", "<cmd>CopilotChat<cr>", desc = "Open Copilot Chat" },
    { "<leader>oc", "<cmd>CopilotChatCommit<cr>", desc = "Copilot Commit Message" },
    { "<leader>of", "<cmd>CopilotChatFix<cr>", desc = "Copilot Fix Code" },
  },
}
