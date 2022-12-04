local keymap = vim.keymap.set

vim.cmd([[
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>l
vnoremap <C-s> <Esc>:w<CR>
map <C-a> ggVG


nnoremap <Leader>ff :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>

nnoremap <silent> <C-\> :NvimTreeToggle<CR>


nnoremap <C-Right> :BufferLineCycleNext<CR>
nnoremap <C-Left> :BufferLineCyclePrev<CR>
nnoremap <A-Right> :BufferLineCycleNext<CR>
nnoremap <A-Left> :BufferLineCyclePrev<CR>


nnoremap <C-f> :Neoformat<CR>

let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 0


set tagfunc=jsfileimport#tagfunc
nnoremap <Leader>if <Plug>(JsFileImport)
nnoremap <Leader>iF <Plug>(JsFileImportList)
nnoremap <Leader>ig <Plug>(JsGotoDefinition)
nnoremap <Leader>iG <Plug>(JsGotoDefinition)
nnoremap <Leader>ip <Plug>(PromptJsFileImport)
nnoremap <Leader>is <Plug>(SortJsFileImport)
nnoremap <Leader>ic <Plug>(JsFixImport)

:nnoremap <Leader>x :Bdelete<CR>
command! -bang -complete=buffer -nargs=? Bclose Bdelete<bang> <args>

nmap <C-i> <Plug>(JsFileImport)
nmap <C-u> <Plug>(PromptJsFileImport)
let g:js_file_import_use_telescope = 1
set wildignore+=*node_modules/**

let g:user_emmet_leader_key='<,>,'

" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

]])
-- BASH - Auto preenche arquivos .sh que não existirem com a SheBang
vim.cmd([[ autocmd BufNewFile *.sh :call append(0, '#!/usr/bin/env bash') ]])

-- LSP Diagnostics Toggle bindings
keymap("n", "<Leader>dd", "<cmd> ToggleDiag <cr>")
keymap("n", "<leader>du", "<Plug>(toggle-lsp-diag-underline)")
keymap("n", "<leader>ds", "<Plug>(toggle-lsp-diag-signs)")
keymap("n", "<leader>dv", "<Plug>(toggle-lsp-diag-vtext)")
keymap("n", "<leader>di", "<Plug>(toggle-lsp-diag-update_in_insert)")

-- Bracey bindings
keymap("n", "<Leader>b", "<cmd> Bracey <cr>")
keymap("n", "<Leader>bb", "<cmd> BraceyStop <cr>")
keymap("n", "<Leader>bbb", "<cmd> BraceyReload <cr>")
vim.cmd "nnoremap <leader>fc <CMD>Telescope command_center<CR>"
