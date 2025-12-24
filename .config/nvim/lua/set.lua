vim.g.mapleader = ','

vim.opt.guicursor = "" -- Enable syntax highlighting

vim.opt.mouse = ''

vim.opt.clipboard = 'unnamedplus'

vim.opt.swapfile = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.termguicolors = false

vim.cmd('autocmd BufWritePre * :%s/\\s\\+$//e')

function LspDiagnosticsCounts()
  local bufnr = vim.api.nvim_get_current_buf()
  local error_count = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
  local warn_count  = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN })
  local info_count  = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.INFO })
  local hint_count  = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.HINT })
  local parts = {}
  if error_count > 0 then table.insert(parts, "E:" .. error_count) end
  if warn_count > 0 then table.insert(parts, "W:" .. warn_count) end
  if info_count > 0 then table.insert(parts, "I:" .. info_count) end
  if hint_count > 0 then table.insert(parts, "H:" .. hint_count) end
  return table.concat(parts, " ")
end

vim.o.statusline = "%f %h%m%r %{v:lua.LspDiagnosticsCounts()} %=%-14.(%l,%c%V%) %P"

vim.keymap.set("n", "]b", ":bnext<CR>")
vim.keymap.set("n", "[b", ":bprevious<CR>")
