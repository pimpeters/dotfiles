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
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'dracula/vim'
Plugin 'wincent/Command-T'
Plugin 'mileszs/ack.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
Plugin 'SirVer/ultisnips'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'jwalton512/vim-blade'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'tpope/vim-fugitive'
Plugin 'dylanaraps/wal.vim'
Plugin 'noahfrederick/vim-noctu'

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
set nowrap " don't wrap code
set colorcolumn=80
set backspace=indent,eol,start
set showcmd
set completeopt=longest,menuone
set lazyredraw
set ttyfast

" Additional space underneath here is like supposed
set fillchars=diff:·
let mapleader = ","

" File specific settings
autocmd Filetype python setlocal noexpandtab tabstop=4 shiftwidth=4 " use tabs for Pyton (overwrite system settings)
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType php,blade autocmd BufWritePre <buffer> %s/\s\+$//e " remove whitespaces in PHP
autocmd Filetype php,blade autocmd BufWritePre <buffer> :%retab
autocmd BufEnter * :syn sync maxlines=500

" Color options
set t_Co=16
colorscheme noctu

" Plugin settings
let g:ctrlp_map = ''
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
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
" Move a line up/down with Shift-k/j
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==

nnoremap <leader>. :CtrlPTag<cr>

" Remove mapping for arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Visual mode mapping
" Move selected lines up/down with Shift-k/j
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ }

function! LightLineFilename()
  return expand('%')
endfunction

if executable('ag')
    let g:ackprg = 'ag -S --nogroup --column --ignore node_modules --ignore "./public/*" --ignore "./vendor/*" --ignore tags --vimgrep'
endif

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

if &term =~ "xterm" || &term =~ "screen"
	let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

if !empty(glob("~/.vimrc.local"))
	source ~/.vimrc.local
:endif
