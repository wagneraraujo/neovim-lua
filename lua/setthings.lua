
vim.cmd([[
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.ts,*.tsx,*.vue,*.svelte,*.jsp,*.php,*.erb'

filetype plugin indent on
syntax on


set foldlevel=0
set foldlevel=99

highlight link matchTag Search
highlight link matchTag MatchParen
highlight matchTag gui=reverse


set re=0


autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:user_emmet_mode='n'
let g:user_emmet_mode='inv'
let g:user_emmet_mode='a'
let g:user_emmet_install_global =1
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
      \  'javascript' : {
        \      'extends' : 'tsx',
        \  },
        \}


highlight Cursor guifg=white guibg=orange
highlight iCursor guifg=white guibg=white
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

set tagfunc=jsfileimport#tagfunc
set runtimepath^=~/.vim/bundle/bbye
let g:vim_jsx_pretty_colorful_config = 1 " default 0

let g:loaded_matchit = 1

let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jsx' : 1,
    \ 'tsx' : 1,
    \ 'js' : 1,
    \ 'jinja' : 1,
    \}
highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen



vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


let g:anyfold_fold_comments=1
set foldlevel=0
autocmd Filetype cpp set foldignore=#/
let g:cursorhold_updatetime = 100

set statusline+=%{get(b:,'gitsigns_status','')}


augroup javasupport
	autocmd!
	autocmd FileType java compiler javac
	au Filetype java setlocal makeprg=javac\ %\ -g
	au Filetype java setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
	au FileType java noremap <buffer> <leader>c <Esc>:w<cr>:make<cr>:cwindow<cr>
	au FileType java noremap <buffer> <leader>r :!clear;echo;echo %\|awk -F. '{print $1}'\|xargs java<cr>
augroup end

]])


vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true
