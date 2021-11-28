"  _     _          _                  _
" (_)___| |__  _ __( )___   _ ____   _(_)_ __ ___
" | |_  / '_ \| '__|// __| | '_ \ \ / / | '_ ` _ \
" | |/ /| |_) | |    \__ \ | | | \ V /| | | | | | |
" |_/___|_.__/|_|    |___/ |_| |_|\_/ |_|_| |_| |_|

" misc defaults
    set nocompatible
    filetype off
    set encoding=utf-8
    set backspace=2
    filetype plugin on
    set omnifunc=syntaxcomplete#Complete    "language specific text completion with <C-X><C-O>
    set showcmd
    set nrformats+=alpha    " treats all characters as numbers (can increment/decrement)

    colorscheme gruvbox

" tabs are 4 spaces
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4

" numbering 
    set number
    set relativenumber

" provides tab completion for all files (incl. subfolders)
    set path+=**

" automatically indent
    set autoindent

" search as characters are entered
    set incsearch
" highlight matched characters
    set hlsearch
" Ignore case when searching 
    set ignorecase
" case sensitive when upercase character included
    set smartcase 

" shows an autocomplete menu when typing a command
    set wildmenu
    set wildignorecase " ignorecase autocomplete
    set completeopt=preview
    set wildmode=longest,list,full

" display ruler on bottom right
    set ruler

" auto updates file if external source edits the file
    set autoread

" improves performance by only redrawing screen when required
    set lazyredraw

" folding
    set foldenable
    set foldlevelstart=10
    set foldmethod=indent

    " folds code using spacebar instead of za combination
        nnoremap <space> za

" increment/decrement numbers using + and -
    nnoremap + <C-a>
    nnoremap - <C-x>

" plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-surround' " smart surroundings
Plug 'ycm-core/youcompleteme',  {'do': './install.py --tern-completer'} " code completion
Plug 'scrooloose/nerdtree' " tree explorer
Plug 'scrooloose/syntastic' " syntax checking
Plug 'vim-airline/vim-airline' " airline at bottom
Plug 'vim-airline/vim-airline-themes' " airline themes
Plug 'junegunn/fzf' " commandline fuzzy finder
Plug 'morhetz/gruvbox' " colour scheme
Plug 'sheerun/vim-polyglot' " language pack
Plug 'majutsushi/tagbar' " tagbar

call plug#end()

" plugin related settings
    let g:airline_theme='gruvbox' " gruvbox airline
    map <silent> <C-E> :NERDTree<CR> " open NERDTree w ctrl+e
    nmap <C-R> :TagbarToggle<CR> " open Tagbar w ctrl+r
