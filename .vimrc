""""""""""
" Vundle "
""""""""""
set nocompatible
filetype off

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
" Improved PHP omni-completion
Plugin 'shawncplus/phpcomplete.vim'
" Fuzzyfinder for files and buffers
Plugin 'wincent/Command-T'
" Fuzzyfinder for buffers
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
" Replacement for grep (finding strings inside files)
Plugin 'mileszs/ack.vim'
" Statusbar for vim
Plugin 'itchyny/lightline.vim'
" Shows Vim diff inline
Plugin 'airblade/vim-gitgutter'
" Better workflow for HTML/CSS
Plugin 'mattn/emmet-vim'
" Docblock generator for PHP
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
Plugin 'SirVer/ultisnips'
" Display vertical lines for each indent level
Plugin 'Yggdroot/indentLine'
" Syntax highlighting for Blade templates
Plugin 'jwalton512/vim-blade'
" Git commands inside Vim
Plugin 'tpope/vim-fugitive'
" Highlight while search
Plugin 'haya14busa/incsearch.vim'
" Colorscheme
Plugin 'Disgeae/vim-noctu'

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
" shawncplus/phpcomplete.vim
let g:phpcomplete_index_composer_command='/usr/local/bin/composer'
let g:phpcomplete_parse_docblock_comments =1
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
" wincent/Command-T
let g:CommandTWildIgnore=&wildignore . ",*/node_modules/*,*/vendor/*"
if &term =~ "xterm" || &term =~ "screen"
	let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif
" ctrlpvim/ctrlp.vim
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" mileszs/ack.vim
if executable('ag')
    let g:ackprg = 'ag -S --nogroup --column --ignore node_modules --ignore "./public/*" --ignore "./vendor/*" --ignore tags --vimgrep'
endif
" itchyny/lightline.vim
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
" tobyS/pdv
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"



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
" Move lines up/down
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv
" Disable arrowkeys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

""""""""""""""""""""""
" Plugin keybindings "
""""""""""""""""""""""
" scrooloose/nerdtree
map <Leader>n :NERDTreeToggle<cr>
map <Leader>m :NERDTreeFind<cr>
" ctrlpvim/ctrlp.vim
let g:ctrlp_map = ''
map <Leader>r :CtrlPBufTag<cr>
" tobyS/pdv
map <Leader>q :call pdv#DocumentWithSnip()<cr>
" airblade/vim-gitgutter
nmap <Leader>] <Plug>GitGutterNextHunk
nmap <Leader>[ <Plug>GitGutterPrevHunk
" haya14busa/incsearch.vim 
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" mattn/emmet-vim
let g:user_emmet_leader_key='<Leader>e'

""""""""""""""""
" Local .vimrc "
""""""""""""""""
if !empty(glob("~/.vimrc.local"))
	source ~/.vimrc.local
:endif
