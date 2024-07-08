" - PLUGINS -
" Read install instructions on github.com/junegunn/vim-plug
call plug#begin()
" Fuzzyfinder for files and buffers
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Replacement for grep (finding strings inside files)
Plug 'mileszs/ack.vim'
" Shows Vim diff inline
Plug 'airblade/vim-gitgutter'
" Git functions wrapper
Plug 'tpope/vim-fugitive'
" Colorscheme
Plug 'pimpeters/vim-persephone'
" Range, pattern and substitute preview
Plug 'markonm/traces.vim'
" Github Copilot
Plug 'github/copilot.vim'
" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

" - SETTINGS -
" Enable syntax highlighting
syntax on
" Use system clipboard
set clipboard=unnamed
" Apply colorscheme
colorscheme persephone
" Disable swap files
set noswapfile
" Each tab is 4 spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" Relative linenumber and current line number
set relativenumber nu
" More natural feelings when opening splits
set splitbelow splitright
" Prevent wrapping of lines
set nowrap
" Emulate 16 colors
set t_Co=16
" Search while typing
set incsearch
" Strip whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" Marker at 80
set colorcolumn=80

" - PLUGIN SETTINGS -
" mileszs/ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
" airblade/vim-gitgutter
autocmd BufWritePost * GitGutter
" junegunn/fzf.vim
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
" arnaud-lb/vim-php-namespace
let g:php_namespace_sort_after_insert = 1

" - KEYBINDS -
" Remap leader to comma
let mapleader = ","
map <Leader>m :Vexplore<cr>

" - PLUGIN KEYBINDS -
" junegunn/fzf.vim
map <leader>f :FZF<cr>
map <leader>b :Buffers<cr>
map <leader>t :Tags<cr>
" airblade/vim-gitgutter
nmap <Leader>] <Plug>(GitGutterNextHunk)
nmap <Leader>[ <Plug>(GitGutterPrevHunk)
nmap <Leader>= <Plug>(GitGutterPreviewHunk)
" neoclide/coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codeaction-line)
xmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a <Plug>(coc-codeaction-cursor)
nmap <silent> gA <Plug>(coc-codeaction)

" - LOCAL VIMRC -
if !empty(glob("~/.vimrc.local"))
	source ~/.vimrc.local
:endif
