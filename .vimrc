" - PLUGINS -
" Read install instructions on github.com/junegunn/vim-plug
call plug#begin()
" Treeview of current dir
Plug 'scrooloose/nerdtree'
" Git for NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Syntax checker
Plug 'w0rp/ale'
" Fuzzyfinder for files and buffers
" (if update of fzf is needed, run: :call fzf#install()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Replacement for grep (finding strings inside files)
Plug 'mileszs/ack.vim'
" Shows Vim diff inline
Plug 'airblade/vim-gitgutter'
" Display vertical lines for each indent level
Plug 'Yggdroot/indentLine'
" Git functions wrapper
Plug 'tpope/vim-fugitive'
" Better substitute
Plug 'tpope/vim-abolish'
" Colorscheme
Plug 'pimpeters/vim-noctu'
" Inline PHP docs
Plug 'alvan/vim-php-manual'
" Range, pattern and substitute preview
Plug 'markonm/traces.vim'
" Expanding abbreviations
Plug 'mattn/emmet-vim'
" Namespaces
Plug 'arnaud-lb/vim-php-namespace'
" Vue.js syntax highlighting
Plug 'posva/vim-vue'
" Show which class / function you're in
Plug 'wellle/context.vim'
" Github Copilot
Plug 'github/copilot.vim'
call plug#end()

" - SETTINGS -
" Enable syntax highlighting
syntax on
" Use old regular expression engine
set re=1
" Always show statusbar
set laststatus=2
" Colorscheme
colorscheme noctu
" Disable swap files
set noswapfile
" Each tab is 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Replace tabs for spaces
set expandtab
" Relative linenumbers
set relativenumber
" Current linenumber
set nu
" More natural feelings when opening splits
set splitbelow
set splitright
" Don't ever a line
set nowrap
" Show a column at line 80
set colorcolumn=80
" Always show statusbar
set laststatus=2
" Normal backspace behaviour
set backspace=indent,eol,start
" Completions like an IDE
set completeopt=longest,menuone
" Search while typing
set incsearch
" Emulate 16 colors
set t_Co=16
" Avoid bells (prevents possible flashing screen)
set belloff=all
" Show HTML syntax highlighting in PHP files
let php_htmlInStrings = 1
" Overwite for PHP/Blade to strip whitespaces on save
autocmd FileType php,blade,python autocmd BufWritePre <buffer> %s/\s\+$//e
" Overwite for PHP/Blade to retab on save
autocmd Filetype php,blade,python autocmd BufWritePre <buffer> :%retab

" - PLUGIN SETTINGS -
" scrooloose/nerdtree
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers=1
" mileszs/ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
" airblade/vim-gitgutter
autocmd BufWritePost * GitGutter
" junegunn/fzf.vim
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" - KEYBINDS -
" Remap leader to comma
let mapleader = ","
" Copy/cut/paste from clipboard
map <leader>p "+p
map <leader>y "+y
map <leader>d "+d
map <leader>Y "+Y
map <leader>P "+P
map <leader>D "+D

" - PLUGIN KEYBINDS -
" junegunn/fzf.vim
map <leader>f :FZF<cr>
map <leader>b :Buffers<cr>
map <leader>t :Tags<cr>
map <leader>T :BTags<cr>
" scrooloose/nerdtree
map <Leader>n :NERDTreeToggle<cr>
map <Leader>m :NERDTreeFind<cr>
" airblade/vim-gitgutter
nmap <Leader>] <Plug>(GitGutterNextHunk)
nmap <Leader>[ <Plug>(GitGutterPrevHunk)
nmap <Leader>= <Plug>(GitGutterPreviewHunk)
" mattn/emmet-vim
let g:user_emmet_leader_key='<Leader>e'
" arnaud-lb/vim-php-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" - LOCAL VIMRC -
if !empty(glob("~/.vimrc.local"))
	source ~/.vimrc.local
:endif
