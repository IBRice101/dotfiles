"  _     _          _             _                    
" (_)___| |__  _ __( )___  __   _(_)_ __ ___  _ __ ___ 
" | |_  / '_ \| '__|// __| \ \ / / | '_ ` _ \| '__/ __|
" | |/ /| |_) | |    \__ \  \ V /| | | | | | | | | (__ 
" |_/___|_.__/|_|    |___/ (_)_/ |_|_| |_| |_|_|  \___|

" misc defaults
    set nocompatible
    filetype off
    set encoding=utf-8
    set backspace=2
    filetype plugin on
    set showcmd
    
" colour scheme
    syntax enable
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

" cursor movement
    " line movement
        imap <A-Left> <Esc> 0i
        nmap <A-Left> 0
        imap <A-Right> <Esc><Right> $i
        nmap <A-Right> $

" search as characters are entered
    set incsearch
" highlight matched characters
    set hlsearch
" Ignore case when searching 
    set ignorecase

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

" file browsing
    " no banner
    let g:netrw_banner = 0
    " open file in previous window
    let g:netrw_browse_split = 4
    " 25% width
    let g:netrw_winsize = 25
    " for quick edits, open the file in sensible places
    let g:netrw_altv = 1
    let g:netrw_alto = 1

    " open file browser in left window using ctrl+e
        map <silent> <C-E> :Lexplore<CR>

" folding
    set foldenable
    set foldlevelstart=10
    set foldmethod=indent

    " folds code using spacebar instead of za combination
        nnoremap <space> za 

" creates tags file an allows you to jump to function definitions etc
    command! MakeTags !ctags --recurse .
    " - Use Ctrl-] to jump to tag under cursor
    " - Use g-Ctrl-] for ambiguous tags
    " - Use Ctrl-t to jump back up the tag stack

" language specific settings
    " plaintext and markdown
        " spell check for markdown and txt files
            autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb
            autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_gb

    " python
        " save and run python with f5 (second for if in insert mode)
            autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
            autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>