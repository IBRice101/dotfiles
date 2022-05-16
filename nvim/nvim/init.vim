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
    nmap <F8> :TagbarToggle<CR> " open Tagbar w f8

" language specific settings
    " plaintext and markdown
        " spell check for markdown and txt files
            autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb
            autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_gb

    " web dev
        " html
            " execute html file from html file
                autocmd FileType html map <buffer> <F5> :w<CR>:exec '!firefox' shellescape(@%, 1)<CR>
                autocmd FileType html imap <buffer> <F5> <esc>:w<CR>:exec '!firefox' shellescape(@%, 1)<CR>
        " js
            " comment out selected lines (in visual mode)
                autocmd FileType javascript noremap <F4> :norm I//<CR>

    " python
        " save and run with f5 (second for if in insert mode)
            autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
            autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
        " comment out selected lines (in visual mode)
            autocmd FileType python noremap <F4> :norm I#<CR>
        " 80 column border
            autocmd FileType python set colorcolumn=80

    " skeletons
        augroup skeletons
            autocmd!
            " adds shebangs and boilerplate to files
            autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh
            autocmd BufNewFile *.py 0r ~/.config/nvim/templates/skeleton.py
            autocmd BufNewFile *.html 0r ~/.config/nvim/templates/skeleton.html
        augroup END

