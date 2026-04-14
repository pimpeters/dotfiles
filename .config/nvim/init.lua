vim.loader.enable()

require("set")
require("pack")

-- Plugin configurations
local plugins = {
    "plugins.persephone",
    "plugins.treesitter",
    "plugins.treesitter-context",
    "plugins.harpoon",
    "plugins.snacks",
    "plugins.tree",
    "plugins.fugitive",
    "plugins.gitsigns",
    "plugins.copilot",
    "plugins.copilot-chat",
    "plugins.lsp",
}

for _, plugin in ipairs(plugins) do
    local ok, err = pcall(require, plugin)
    if not ok then
        vim.notify("Failed to load " .. plugin .. ": " .. err, vim.log.levels.WARN)
    end
end
