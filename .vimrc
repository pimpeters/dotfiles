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
" Syntax checker
Plugin 'scrooloose/syntastic'
" Fuzzyfinder for files and buffers
Plugin 'wincent/Command-T'
" Fuzzyfinder for buffers
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
" Replacement for grep (finding strings inside files)
Plugin 'mileszs/ack.vim'
" Shows Vim diff inline
Plugin 'airblade/vim-gitgutter'
" Display vertical lines for each indent level
Plugin 'Yggdroot/indentLine'
" Git functions wrapper
Plugin 'tpope/vim-fugitive'
" Colorscheme
Plugin 'pimpeters/vim-noctu'
" Inline PHP docs
Plugin 'alvan/vim-php-manual'
" Range, pattern and substitute preview
Plugin 'markonm/traces.vim'

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
" scrooloose/syntastic
let g:syntastic_python_python_exec = 'python3'
" wincent/Command-T
let g:CommandTWildIgnore=&wildignore . ",*/node_modules/*,*/vendor/*,*/includes/src"
if &term =~ "xterm" || &term =~ "screen"
	let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif
" ctrlpvim/ctrlp.vim
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" mileszs/ack.vim
if executable('ag')
    let g:ackprg = 'ag -S --nogroup --column --ignore node_modules --ignore "./public/*" --ignore "./vendor/*" --ignore tags --vimgrep'
endif
" airblade/vim-gitgutter
autocmd BufWritePost * GitGutter


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
" scrooloose/nerdtree
map <Leader>n :NERDTreeToggle<cr>
map <Leader>m :NERDTreeFind<cr>
" ctrlpvim/ctrlp.vim
let g:ctrlp_map = ''
map <Leader>r :CtrlPBufTag<cr>
" airblade/vim-gitgutter
nmap <Leader>] <Plug>GitGutterNextHunk
nmap <Leader>[ <Plug>GitGutterPrevHunk
nmap <Leader>= <Plug>GitGutterPreviewHunk

""""""""""""""""
" Local .vimrc "
""""""""""""""""
if !empty(glob("~/.vimrc.local"))
	source ~/.vimrc.local
:endif
