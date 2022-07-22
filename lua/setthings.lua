
vim.cmd([[

let extension = expand('%:e')

let g:vim_matchtag_enable_by_default = 0
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.ts,*.tsx,*.vue,*.svelte,*.jsp,*.php,*.erb'

filetype plugin indent on
syntax on


set foldlevel=0
set foldlevel=99

highlight link matchTag Search
highlight link matchTag MatchParen
highlight matchTag gui=reverse


set re=0

]])
