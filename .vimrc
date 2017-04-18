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

Plugin 'majutsushi/tagbar'

Plugin 'scrooloose/syntastic'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'junegunn/vim-easy-align'

Plugin 'szw/vim-tags'

Plugin 'shawncplus/phpcomplete.vim'

Plugin 'kristijanhusak/vim-hybrid-material'

Plugin 'dracula/vim'

Plugin 'wincent/Command-T'

Plugin 'ervandew/supertab'

Plugin 'rking/ag.vim'

Plugin 'ryanoasis/vim-devicons'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-surround'

Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set noswapfile
set softtabstop=4
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
set ruler
set noexpandtab
set relativenumber
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
nmap <C-r> :CtrlPBufTag<cr>
nmap <C-t> :CommandT<cr>
let g:phpcomplete_index_composer_command='/usr/local/bin/composer'
colorscheme dracula 
set splitright
set guifont=Roboto\ Mono:h14
set guioptions-=l                                               "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R
set nowrap
let g:CommandTMaxFiles=500000
let g:ag_prg='ag -S --nocolor --nogroup --column --ignore node_modules --ignore "./public/*" --ignore tags'
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>
set laststatus=2
let php_htmlInStrings = 1
let g:syntastic_python_python_exec = 'python3'
autocmd Filetype python setlocal noexpandtab tabstop=4 shiftwidth=4