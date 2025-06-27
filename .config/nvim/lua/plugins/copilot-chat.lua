return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  opts = {},
  keys = {
    { "<leader>oc", "<cmd>CopilotChat<cr>", desc = "Open Copilot Chat" },
    { "<leader>oo", "<cmd>CopilotChatOptimize<cr>", desc = "Copilot Optimize Code" },
  },
}
