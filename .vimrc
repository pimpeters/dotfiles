""""""""""
" Vundle "
""""""""""
set nocompatible
filetype off

au BufEnter /private/tmp/crontab.* setl backupcopy=yes
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"""""""""""'"""""""""""
" Plugins and options "
"""""""""""""""""""""""
" Treeview of current dir
Plugin 'scrooloose/nerdtree'
" Git for NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Syntax checker
Plugin 'w0rp/ale'
" Fuzzyfinder for files and buffers
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Replacement for grep (finding strings inside files)
Plugin 'mileszs/ack.vim'
" Shows Vim diff inline
Plugin 'airblade/vim-gitgutter'
" Display vertical lines for each indent level
Plugin 'Yggdroot/indentLine'
" Git functions wrapper
Plugin 'tpope/vim-fugitive'
" Better substitute
Plugin 'tpope/vim-abolish'
" Colorscheme
Plugin 'pimpeters/vim-noctu'
" Inline PHP docs
Plugin 'alvan/vim-php-manual'
" Range, pattern and substitute preview
Plugin 'markonm/traces.vim'
" Expanding abbreviations
Plugin 'mattn/emmet-vim'
" Better syntax highlighting
Plugin 'sheerun/vim-polyglot'
" Namespaces
Plugin 'arnaud-lb/vim-php-namespace'
" Vue.js syntax highlighting
Plugin 'posva/vim-vue'

""""""""""
" Vundle "
""""""""""
call vundle#end()
filetype plugin indent on

"""""""""""""""""""
" Global settings "
"""""""""""""""""""
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
" Show HTML syntax highlighting in PHP files
let php_htmlInStrings = 1
" Overwite for PHP/Blade to strip whitespaces on save
autocmd FileType php,blade,python autocmd BufWritePre <buffer> %s/\s\+$//e
" Overwite for PHP/Blade to retab on save
autocmd Filetype php,blade,python autocmd BufWritePre <buffer> :%retab
" Fix for editing crontabs
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

"""""""""""""""""""
" Plugin settings "
"""""""""""""""""""
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

""""""""""""""""""""""
" Global keybindings "
""""""""""""""""""""""
" Remap leader to comma
let mapleader = ","
" Copy/cut/paste from clipboard
map <leader>p "+p
map <leader>y "+y
map <leader>d "+d
map <leader>Y "+Y
map <leader>P "+P
map <leader>D "+D

""""""""""""""""""""""
" Plugin keybindings "
""""""""""""""""""""""
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

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

""""""""""""""""
" Local .vimrc "
""""""""""""""""
if !empty(glob("~/.vimrc.local"))
	source ~/.vimrc.local
:endif
