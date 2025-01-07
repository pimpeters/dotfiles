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

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.cmd('autocmd BufWritePre * :%s/\\s\\+$//e')
