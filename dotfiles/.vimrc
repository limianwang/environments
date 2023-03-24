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
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'pechorin/any-jump.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'dense-analysis/ale'

Plugin 'dart-lang/dart-vim-plugin'
Plugin 'thosakwe/vim-flutter'
Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'
Plugin 'majutsushi/tagbar'
Plugin 'itchyny/lightline.vim'
Plugin 'posva/vim-vue'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-python/python-syntax'
Plugin 'leafgarland/typescript-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'sainnhe/everforest'
call vundle#end()

filetype plugin indent on

if !exists("g_syntax_on")
	syntax enable
endif

if has('termguicolors')
  set termguicolors
endif

let g:tokyonight_style = "night"
let g:everforest_background = "hard"
let g:everforest_better_performance = 1

try
  colorscheme tokyonight
catch
endtry

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [
      \             ['lineinfo'],
      \             ['percent'],
      \             ['fileformat', 'fileencoding', 'filetype']],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

let g:ale_sign_column_always = 1

" vim-go
let g:go_fmt_command = "goimports"
"let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1

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
set smarttab

set tabstop=2
set shiftwidth=2
set expandtab
set textwidth=99

set colorcolumn=100

" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" autocmd VimEnter * nested :TagbarOpen
" autocmd VimEnter * nested :NERDTree

" any jump
" Show line numbers in search rusults
let g:any_jump_list_numbers = 0

" Auto search references
let g:any_jump_references_enabled = 1

" Auto group results by filename
let g:any_jump_grouping_enabled = 0

" Amount of preview lines for each search result
let g:any_jump_preview_lines_count = 5

" Max search results, other results can be opened via [a]
let g:any_jump_max_search_results = 10

" Prefered search engine: rg or ag
let g:any_jump_search_prefered_engine = 'rg'


" Search results list styles:
" - 'filename_first'
" - 'filename_last'
let g:any_jump_results_ui_style = 'filename_first'

" Any-jump window size & position options
let g:any_jump_window_width_ratio  = 0.6
let g:any_jump_window_height_ratio = 0.6
let g:any_jump_window_top_offset   = 4

" Customize any-jump colors with extending default color scheme:
let g:any_jump_colors = { "help": "Comment" }

" Or override all default colors
let g:any_jump_colors = {
      \"plain_text":         "Comment",
      \"preview":            "Comment",
      \"preview_keyword":    "Operator",
      \"heading_text":       "Function",
      \"heading_keyword":    "Identifier",
      \"group_text":         "Comment",
      \"group_name":         "Function",
      \"more_button":        "Operator",
      \"more_explain":       "Comment",
      \"result_line_number": "Comment",
      \"result_text":        "Statement",
      \"result_path":        "String",
      \"help":               "Comment"
      \}

" Disable default any-jump keybindings (default: 0)
let g:any_jump_disable_default_keybindings = 0

" Remove comments line from search results (default: 1)
let g:any_jump_remove_comments_from_results = 1

" Custom ignore files
" default is: ['*.tmp', '*.temp']
let g:any_jump_ignored_files = ['*.tmp', '*.temp']

" Search references only for current file type
" (default: false, so will find keyword in all filetypes)
let g:any_jump_references_only_for_current_filetype = 0

" Disable search engine ignore vcs untracked files
" (default: false, search engine will ignore vcs untracked files)
let g:any_jump_disable_vcs_ignore = 0

autocmd BufWritePre * :%s/\s\+$//e
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype go inoremap <C-p> <C-x><C-o>

au VimLeave * if filereadable("~/.vim/.netrwhist")|call delete("~/.vim/.netrwhist")|endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>
map <C-j> :AnyJump<CR>

highlight ColorColumn guibg=lightgrey ctermbg=darkgrey

" 80 width
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%91v.\+/
