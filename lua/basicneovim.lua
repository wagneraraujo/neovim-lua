vim.cmd([[
syntax on
" set shada="NONE"
set re=1
set nohlsearch
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
set lazyredraw
let mapleader=','
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set omnifunc
set fileformats=unix,dos,mac
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif
syntax on
set ruler
set nu!
set number
let no_buffers_menu=1
"set mousemodel=popup
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
set t_Co=256
set guioptions=egmrti
set gfn='FiraCode'\ 11
set mouse=
if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1
endif

set cursorline
:highlight Cursorline cterm=bold ctermbg=black


au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=3


  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source  | PackerCompile
  augroup end


	set t_Co=256


let term_program=$TERM_PROGRAM

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

if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

autocmd FileType apache setlocal commentstring=#\ %s
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[


au! BufRead,BufNewFile *.block set filetype=html


" hi cursorline cterm=none term=none
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd BufEnter * EnableBlameLine
nnoremap <Leader>if <Plug>(JsFileImport)

nnoremap <Leader>iF <Plug>(JsFileImportList)
nnoremap <Leader>ip <Plug>(PromptJsFileImport)
nnoremap <Leader>is <Plug>(SortJsFileImport)
nnoremap <Leader>ic <Plug>(JsFixImport)

" hi hlgroup gui=underline


]])

vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"
-- vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme darkplus")
vim.api.nvim_create_user_command("FixWhitespace", [[%s/\s\+$//e]], {})
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- treesiter
vim.opt.writebackup = false
vim.opt.termguicolors = true
vim.opt.conceallevel = 2
vim.opt.ignorecase = true -- search case
vim.opt.smartcase = true -- search matters if capital letter
vim.opt.inccommand = "split" -- "for incsearch while sub
vim.opt.lazyredraw = true -- redraw for macros
vim.opt.termguicolors = true -- true colors term support
vim.opt.undofile = true -- undo even when it closes
vim.opt.scrolloff = 8 -- number of lines to always go down
vim.opt.signcolumn = "number"
vim.opt.colorcolumn = "99999" -- fix columns
vim.opt.splitbelow = true -- split windows below
vim.opt.splitright = true -- split windows right
vim.opt.wildmode = "list:longest,list:full" -- for : stuff
vim.opt.wildignore:append({ ".javac", "node_modules", "*.pyc" })
vim.opt.suffixesadd:append({ ".java", ".rs" }) -- search for suffexes using gf
vim.opt.diffopt:append { "internal,algorithm:patience" }
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = "noinsert,menuone,noselect"
vim.opt.conceallevel = 0
vim.opt.pumheight = 10
vim.opt.showtabline = 0
vim.opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.guifont = "monospace:h17"
vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 250
vim.opt.wildmenu = true
vim.opt.wrap = true
vim.opt.foldmethod = "manual"
