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

Plugin 'gmarik/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'

call vundle#end()

filetype plugin indent on

syntax on

let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid

" Generic
set number
set visualbell
set nowrap
set showcmd
set ruler
set wildmenu
set nostartofline
set splitbelow
set splitright

" enable smart search
set incsearch
set hlsearch
set ignorecase
set showmatch

" No Backup
set nobackup
set noswapfile

set autoindent
set smartindent
set smartcase

set tabstop=4
set shiftwidth=4
set noexpandtab

" vim-markdown
let g:vim_markdown_folding_disabled=1

autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.coffee :%s/\s\+$//e

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab

au VimLeave * if filereadable("~/.vim/.netrwhist")|call delete("~/.vim/.netrwhist")|endif

" 80 width
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%91v.\+/

au VimLeave * if filereadable("~/.vim/.netrwhist")|call delete("~/.vim/.netrwhist")|endif
