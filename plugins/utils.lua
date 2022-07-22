-- Para nvim-web-devicons
require'nvim-web-devicons'.get_icons()
require'colorizer'.setup()
require('nvim-autopairs').setup({
  enable_check_bracket_line = false
})

require('staline').setup {
	defaults = {
		style = "arrow",
    		expand_null_ls = false,  -- This expands out all the null-ls sources to be shown on the statusline
    		null_ls_symbol = "",  -- A symbol to indicate that a source is coming from null-ls
		left_separator  = "",
		right_separator = "",
		cool_symbol     = " ",       -- Change this to override default OS icon.
		full_path       = false,
		mod_symbol      = "  ",
		lsp_client_symbol = " ",
		line_column     = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.

		fg              = "#000000",  -- Foreground text color.
		bg              = "none",     -- Default background is transparent.
		inactive_color  = "#303030",
		inactive_bgcolor = "none",
		true_colors     = false,       -- true lsp colors.
		font_active     = "none",     -- "bold", "italic", "bold,italic", etc
		branch_symbol   = " ",
	},
	mode_colors = {
    n  = "#921F81",
    i  = "#006A6B",
    ic = "#E4BF7B",
    c  = "#2a6099",
    v  = "#D71B39"
  },
	mode_icons = {
		n = " ",
		i = " ",
		c = " ",
		v = " ",   -- etc..
	},
	sections = {
		left = { '- ', '-mode', 'left_sep_double', ' ', 'branch' },
		mid  = { '-file_name' },
		right = { 'cool_symbol','right_sep_double', '-line_column' },
	},
	special_table = {
		NvimTree = { 'NvimTree', ' ' },
		packer = { 'Packer',' ' },        -- etc
	},
	lsp_symbols = {
		Error=" ",
		Info=" ",
		Warn=" ",
		Hint="",
	},
}
-- Para Barra de status
-- sudo apt install luarocks

vim.cmd [[hi Evil        guifg=#f36365 guibg=#202328]]       -- Higlight for Evil symbol
vim.cmd [[hi StalineEnc  guifg=#7d9955 guibg=#202328]]       -- Encoding Highlight
vim.cmd [[hi StalineGit  guifg=#8583b3 guibg=#202328]]       -- Branch Name Highlight
vim.cmd [[hi StalineFile guifg=#c37cda guibg=#202328]]       -- File name Highlight


--identacao
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
}
