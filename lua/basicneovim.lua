
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

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

endif


au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=3


  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end


	set t_Co=256


let term_program=$TERM_PROGRAM

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
    set termguicolors
else
    if $TERM !=? 'xterm-256color'
        set termguicolors
    endif
endif


let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

nnoremap <c-z> <nop>
]])
