"
" Syntax file are located under ~/.vim/syntax/*
"
" coffee syntax: https://github.com/kchmck/vim-coffee-script
" javascript syntax: http://www.vim.org/scripts/script.php?script_id=1491
" markdown: https://github.com/plasticboy/vim-markdown

set nocompatible

" Vundle
filetype plugin indent off
filetype off
syntax off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'flazz/vim-colorschemes'
Plugin 'pangloss/vim-javascript'

call vundle#end()

filetype plugin indent on

syntax on

let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid

set backspace=2

set number
set showcmd
set hidden
set wildmenu
set nostartofline
set ruler

" Search
set hlsearch
set incsearch

" no backup or swap files
set nobackup
set noswapfile

set background=light
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set autoindent
set copyindent
set smartindent
set ignorecase
set smartcase
set showmatch
set splitbelow
set splitright

set formatoptions+=r
set nowrap
set visualbell

" Removing trailing white spaces.
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.coffee :%s/\s\+$//e

" Adding syntax based on file extension
au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile *.md set filetype=md
au BufRead,BufNewFile *.js set filetype=javascript

" tab spacing based on file extensions
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 smartcase autoindent
autocmd Filetype jade setlocal ts=2 sts=2 sw=2

" 80 width
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%91v.\+/

au VimLeave * if filereadable("~/.vim/.netrwhist")|call delete("~/.vim/.netrwhist")|endif
