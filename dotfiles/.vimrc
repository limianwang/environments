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

Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'rainglow/vim'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elzr/vim-json'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-python/python-syntax'

call vundle#end()

filetype plugin indent on

syntax on

colorscheme hybrid
let g:hybrid_use_iTerm_colors = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" vim-python
let g:python_highlight_all = 1

" vim-markdown
let g:vim_markdown_folding_disabled=1

" Generic
set laststatus=2
set backspace=2
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
set textwidth=99

set colorcolumn=100

" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

autocmd VimEnter * nested :TagbarOpen
" autocmd VimEnter * nested :NERDTree

autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.coffee :%s/\s\+$//e
autocmd BufWritePre * :%s/\s\+$//e
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype json setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype gitcommit setlocal spell textwidth=72

au VimLeave * if filereadable("~/.vim/.netrwhist")|call delete("~/.vim/.netrwhist")|endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>

" 80 width
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%91v.\+/
