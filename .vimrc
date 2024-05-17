" - PLUGINS -
" Read install instructions on github.com/junegunn/vim-plug
call plug#begin()
" Treeview of current dir
Plug 'scrooloose/nerdtree'
" Syntax checker & LSP
Plug 'dense-analysis/ale'
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
Plug 'pimpeters/vim-noctu'
" Range, pattern and substitute preview
Plug 'markonm/traces.vim'
" Namespaces
Plug 'arnaud-lb/vim-php-namespace'
" Github Copilot
Plug 'github/copilot.vim'
call plug#end()

" - SETTINGS -
" Enable syntax highlighting
syntax on
" Use system clipboard
set clipboard=unnamed
" Apply colorscheme
colorscheme noctu
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

" - PLUGIN SETTINGS -
" scrooloose/nerdtree
let NERDTreeShowHidden = 1
" mileszs/ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
" airblade/vim-gitgutter
autocmd BufWritePost * GitGutter
" junegunn/fzf.vim
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" arnaud-lb/vim-php-namespace
let g:php_namespace_sort_after_insert = 1

" - KEYBINDS -
" Remap leader to comma
let mapleader = ","

" - PLUGIN KEYBINDS -
" junegunn/fzf.vim
map <leader>f :FZF<cr>
map <leader>b :Buffers<cr>
map <leader>t :Tags<cr>
" scrooloose/nerdtree
map <Leader>n :NERDTreeToggle<cr>
map <Leader>m :NERDTreeFind<cr>
" airblade/vim-gitgutter
nmap <Leader>] <Plug>(GitGutterNextHunk)
nmap <Leader>[ <Plug>(GitGutterPrevHunk)
nmap <Leader>= <Plug>(GitGutterPreviewHunk)
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
