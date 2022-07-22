
vim.cmd([[
syntax on
set shada="NONE"
set re=1
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set wildmenu
set backspace=indent,eol,start
set autoindent
set lazyredraw
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set confirm
set exrc                                                  " exec command in init.vim
set secure                                                " safely do command above
filetype plugin indent on
set noexpandtab                                           " use only '\t' as tab
set scrolloff=4             
set visualbell                          
set ttyfast
set wildmenu
set backspace=indent,eol,start
set autoindent
set lazyredraw
let mapleader=','
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set fileformats=unix,dos,mac
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif
syntax on
set ruler
set number
let no_buffers_menu=1
set mousemodel=popup
set guioptions=egmrti
let g:CSApprox_loaded = 1
set showmode
set showcmd
set gcr=a:blinkon0
set scrolloff=3
set laststatus=2
set modeline
set modelines=10
set title
set titleold="Terminal"
set titlestring=%F


]])
