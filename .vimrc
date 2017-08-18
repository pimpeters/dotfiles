set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'junegunn/vim-easy-align'
Plugin 'szw/vim-tags'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'dracula/vim'
Plugin 'wincent/Command-T'
Plugin 'ervandew/supertab'
Plugin 'rking/ag.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mattn/emmet-vim'
Plugin 'janko-m/vim-test'
Plugin 'Chun-Yang/vim-action-ag'
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
Plugin 'SirVer/ultisnips'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'jwalton512/vim-blade'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Global settings
syntax on
set noswapfile " disable swapfile
set tabstop=4 " columns for a tab (4 spaces == 1 tab)
set softtabstop=4 " columns for a tab in insert mode
set shiftwidth=4 " columns when using reidents (<< and >>)
set expandtab " Use spaces instead of tabs (more global)
set ruler " show line number in status bar
set relativenumber " show relative line for easier movement
set laststatus=2 " always show the status bar
set splitbelow " naturally opening splits
set splitright " naturally opening splits
set guifont=Roboto\ Mono:h14 " use Roboto Mono as main font if using GUI
set guioptions-=l " hack for GUI to disable scrollbar and such
set guioptions-=L
set guioptions-=r
set guioptions-=R
set nowrap " don't wrap code
set colorcolumn=80
set backspace=indent,eol,start
set showcmd
set completeopt=longest,menuone
let mapleader = ","

" File specific settings
autocmd Filetype python setlocal noexpandtab tabstop=4 shiftwidth=4 " use tabs for Pyton (overwrite system settings)
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType php autocmd BufWritePre <buffer> %s/\s\+$//e " remove whitespaces in PHP
autocmd Filetype php autocmd BufWritePre <buffer> :%retab

" Color options
set t_Co=25
colorscheme dracula

" Plugin settings
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_map = ''
let g:CommandTMaxFiles=500000
let g:ag_prg='ag -S --nocolor --nogroup --column --ignore node_modules --ignore "./public/*" --ignore "./vendor/*" --ignore tags'
let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'
let php_htmlInStrings = 1 " show html tags in colors (in PHP)
let g:syntastic_python_python_exec = 'python3' " use python3 for syntax checking
let g:phpcomplete_index_composer_command='/usr/local/bin/composer'
let g:phpcomplete_parse_docblock_comments =1
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
let g:user_emmet_leader_key='<Leader>y'
let g:CommandTWildIgnore=&wildignore . ",*/node_modules/*,*/vendor/*"

" Global mapping
map <Leader>n :NERDTreeToggle<cr>
map <Leader>m :NERDTreeFind<cr>
map <Leader>p :call pdv#DocumentWithSnip()<cr>
map <Leader>r :CtrlPBufTag<cr>

" Normal mode mapping
nmap * <Plug>AgActionWord

" Visual mode mapping
vmap * <Plug>AgActionVisual

if &term =~ "xterm" || &term =~ "screen"
	let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

if !empty(glob("~/.vimrc.local"))
	source ~/.vimrc.local
:endif
