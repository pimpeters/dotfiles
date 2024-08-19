-- Add lazy.nvim to runtime path
vim.opt.runtimepath:append("~/.local/share/nvim/lazy/lazy.nvim")

-- Initialize lazy.nvim
require('lazy').setup({
  -- Replacement for grep (finding strings inside files)
  'mileszs/ack.vim',

  -- Shows Vim diff inline
  'airblade/vim-gitgutter',

  -- Git functions wrapper
  'tpope/vim-fugitive',

  -- Colorscheme
  'pimpeters/vim-persephone',

  -- Range, pattern and substitute preview
  'markonm/traces.vim',

  -- Github Copilot
  'github/copilot.vim',

  -- LSP
  { 'neoclide/coc.nvim', branch = 'release' },
  { 'yaegassy/coc-intelephense', build = 'yarn install --frozen-lockfile' },
  { 'yaegassy/coc-phpstan', build = 'yarn install --frozen-lockfile' },

  -- PHP CS Fixer
  'stephpy/vim-php-cs-fixer',

  -- Treeview of current dir
  'scrooloose/nerdtree',

  -- Fuzzy finder for files
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
})

-- - SETTINGS -

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Use system clipboard
vim.opt.clipboard = 'unnamed'

-- Apply colorscheme
vim.cmd('colorscheme persephone')

-- Disable swap files
vim.opt.swapfile = false

-- Each tab is 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Relative linenumber and current line number
vim.opt.relativenumber = true
vim.opt.number = true

-- More natural feelings when opening splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Prevent wrapping of lines
vim.opt.wrap = false

-- Enable 256 colors
vim.opt.termguicolors = false  -- Set to false if you are not using true color

-- Search while typing
vim.opt.incsearch = true

-- Strip whitespace on save
vim.cmd('autocmd BufWritePre * :%s/\\s\\+$//e')

-- Marker at 80
vim.opt.colorcolumn = '80'

-- - PLUGIN SETTINGS -

-- mileszs/ack.vim
if vim.fn.executable('ag') == 1 then
  vim.g.ackprg = 'ag --vimgrep'
end

-- airblade/vim-gitgutter
vim.cmd('autocmd BufWritePost * GitGutter')

-- scrooloose/nerdtree
vim.g.NERDTreeShowHidden = 1

-- - KEYBINDS -

-- Remap leader to comma
vim.g.mapleader = ','

-- Plugin key bindings
vim.api.nvim_set_keymap('n', '<leader>s', ':Ack<space>', { noremap = true, silent = true })

-- nvim-telescope/telescope.nvim keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- airblade/vim-gitgutter keybindings
vim.api.nvim_set_keymap('n', '<Leader>]', '<Plug>(GitGutterNextHunk)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>[', '<Plug>(GitGutterPrevHunk)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>=', '<Plug>(GitGutterPreviewHunk)', { noremap = true, silent = true })

-- tpope/vim-fugitive keybindings
vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gd', ':Git diff<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<cr>', { noremap = true, silent = true })

-- neoclide/coc.nvim keybindings
vim.api.nvim_set_keymap('n', '<silent> gd', '<Plug>(coc-definition)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<silent> gr', '<Plug>(coc-references)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<silent> ga', '<Plug>(coc-codeaction-line)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<silent> gA', '<Plug>(coc-codeaction)', { noremap = true, silent = true })

-- stephpy/vim-php-cs-fixer keybindings
vim.api.nvim_set_keymap('n', '<silent><leader>pcf', ':call PhpCsFixerFixFile()<CR>', { noremap = true, silent = true })

-- scrooloose/nerdtree keybindings
vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeToggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>m', ':NERDTreeFind<cr>', { noremap = true, silent = true })
