
vim.cmd([[
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>l
vnoremap <C-s> <Esc>:w<CR>
map <C-a> ggVG


nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <Leader>ff :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>

nnoremap <silent> <C-\> :NvimTreeToggle<CR>


nnoremap <C-Right> :BufferLineCycleNext<CR>
nnoremap <C-Left> :BufferLineCyclePrev<CR>

nnoremap <C-f> :Neoformat<CR>

let b:ale_fixers = ['prettier', 'eslint']


set tagfunc=jsfileimport#tagfunc
nnoremap <Leader>if <Plug>(JsFileImport)
nnoremap <Leader>iF <Plug>(JsFileImportList)
nnoremap <Leader>ig <Plug>(JsGotoDefinition)
nnoremap <Leader>iG <Plug>(JsGotoDefinition)
nnoremap <Leader>ip <Plug>(PromptJsFileImport)
nnoremap <Leader>is <Plug>(SortJsFileImport)
nnoremap <Leader>ic <Plug>(JsFixImport)



]])
-- BASH - Auto preenche arquivos .sh que não existirem com a SheBang
vim.cmd([[ autocmd BufNewFile *.sh :call append(0, '#!/usr/bin/env bash') ]])
