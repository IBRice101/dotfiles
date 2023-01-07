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
    set timeout timeoutlen=3000 ttimeoutlen=100
    let mapleader = ","
    
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
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --tern-completer' } " completion engine
Plug 'scrooloose/syntastic' " syntax checking
Plug 'vim-airline/vim-airline' " airline at bottom
Plug 'vim-airline/vim-airline-themes' " airline themes
Plug 'junegunn/fzf' " commandline fuzzy finder
Plug 'morhetz/gruvbox' " colour scheme
Plug 'sheerun/vim-polyglot' " language pack
Plug 'majutsushi/tagbar' " tagbar
Plug 'rust-lang/rust.vim' " rust support
Plug 'nvim-lua/plenary.nvim' " telescope dependency
Plug 'BurntSushi/ripgrep' " for live_grep and grep_string
Plug 'sharkdp/fd' " finder
Plug 'nvim-treesitter/nvim-treesitter' "finder/preview
Plug 'nvim-telescope/telescope.nvim' " fuzzy finder for files
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua' " file explorer
Plug 'wbthomason/packer.nvim' " package manager
Plug 'lukas-reineke/indent-blankline.nvim' " indent guides
Plug 'romgrk/barbar.nvim' " tablines
Plug 'neovim/nvim-lspconfig' " collection of configs for the language server protocol client
Plug 'vimwiki/vimwiki' " a personal wiki plugin
Plug 'lervag/vimtex' " a LaTeX plugin

call plug#end()

" plugin related settings
    let g:airline_theme='gruvbox' " gruvbox airline
    nmap <F8> :TagbarToggle<CR> " open Tagbar w f8
    " telescope
        nnoremap <Leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
        nnoremap <Leader>fg <cmd>lua require('telescope.builtin').live_grep()<CR>
        nnoremap <Leader>fb <cmd>lua require('telescope.builtin').buffers()<CR>
        nnoremap <Leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>
    " tree
        lua require'nvim-tree'.setup {}
        nnoremap <C-e> :NvimTreeToggle<CR>
    " barbar
        " Move to previous/next
            nnoremap <silent>    <A-,> :BufferPrevious<CR>
            nnoremap <silent>    <A-.> :BufferNext<CR>
            " Re-order to previous/next
            nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
            nnoremap <silent>    <A->> :BufferMoveNext<CR>
            " Goto buffer in position...
            nnoremap <silent>    <A-1> :BufferGoto 1<CR>
            nnoremap <silent>    <A-2> :BufferGoto 2<CR>
            nnoremap <silent>    <A-3> :BufferGoto 3<CR>
            nnoremap <silent>    <A-4> :BufferGoto 4<CR>
            nnoremap <silent>    <A-5> :BufferGoto 5<CR>
            nnoremap <silent>    <A-6> :BufferGoto 6<CR>
            nnoremap <silent>    <A-7> :BufferGoto 7<CR>
            nnoremap <silent>    <A-8> :BufferGoto 8<CR>
            nnoremap <silent>    <A-9> :BufferLast<CR>
            " Pin/unpin buffer
            nnoremap <silent>    <A-p> :BufferPin<CR>
            " Close buffer
            nnoremap <silent>    <A-c> :BufferClose<CR>
            " Magic buffer-picking mode
            nnoremap <silent> <C-s>    :BufferPick<CR>
            " Sort automatically by...
            nnoremap <silent> <Leader>bb :BufferOrderByBufferNumber<CR>
            nnoremap <silent> <Leader>bd :BufferOrderByDirectory<CR>
            nnoremap <silent> <Leader>bl :BufferOrderByLanguage<CR>
            nnoremap <silent> <Leader>bw :BufferOrderByWindowNumber<CR>

            " Other:
                " :BarbarEnable - enables barbar (enabled by default)
                " :BarbarDisable - very bad command, should never be used
    " lsp-config
        lua require'lspconfig'.pyright.setup{}
        lua require'lspconfig'.clangd.setup{}
        lua require'lspconfig'.bashls.setup{}
        lua require'lspconfig'.rls.setup{}
        lua require'lspconfig'.asm_lsp.setup{}

" language specific settings
    " plaintext and markdown
        " spell check for markdown and txt files
            autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb
            autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_gb
            autocmd BufRead,BufNewFile *.wiki setlocal spell spelllang=en_gb

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

    " rust
        " save and run with f5 (second for if in insert mode)
            autocmd FileType rust map <buffer> <F5> :w<CR>:exec '!cargo run' shellescape(@%, 1)<CR>
            autocmd FileType rust imap <buffer> <F5> <esc>:w<CR>:exec '!cargo run' shellescape(@%, 1)<CR>
        " comment out selected lines (in visual mode)
            autocmd FileType rust noremap <F4> :norm I#<CR>
        " 80 column border
            autocmd FileType rust set colorcolumn=80

    " skeletons
        augroup skeletons
            autocmd!
            " adds shebangs and boilerplate to files
            autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh
            autocmd BufNewFile *.py 0r ~/.config/nvim/templates/skeleton.py
            autocmd BufNewFile *.html 0r ~/.config/nvim/templates/skeleton.html
            autocmd BufNewFile *.cpp 0r ~/.config/nvim/templates/skeleton.cpp
            autocmd BufNewFile *.java 0r ~/.config/nvim/templates/skeleton.java
            autocmd BufNewFile *.go 0r ~/.config/nvim/templates/skeleton.go
        augroup END

