
"
" Syntax file are located under ~/.vim/syntax/*
"
" coffee syntax: https://github.com/kchmck/vim-coffee-script
" javascript syntax: http://www.vim.org/scripts/script.php?script_id=1491
" markdown: https://github.com/plasticboy/vim-markdown

syntax on

set nocompatible
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set autoindent
set smartindent
set incsearch
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

" 80 width
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%91v.\+/
