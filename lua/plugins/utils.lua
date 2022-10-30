-- Para nvim-web-devicons
require("nvim-web-devicons").get_icons()
require("colorizer").setup()
-- require('nvim_comment').setup()
require("Comment").setup()

-- require('telescope').load_extension('ag')

-- require("bufferline").setup{
--
-- }

--identacao
vim.opt.list = true

require("indent_blankline").setup({
	show_end_of_line = true,
})

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "poimandres",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

--themes config

-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd [[colorscheme nightfly]]
-- vim.g.catppuccin_flavour = "frappe"
-- vim.cmd "colorscheme catppuccin"
-- end themes config
require("nvim-cursorline").setup({
	cursorline = {
		enable = true,
		timeout = 1000,
		number = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true },
	},
})
-- include treesitter and its config
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"typescript",
		"regex",
		"css",
		"javascript",
		"html",
		"comment",
		"rust",
		"markdown",
		"json",
		"vim",
	},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	sync_install = false,
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false,
		max_file_lines = nil,
	},
	autopairs = { enable = true },
	incremental_selection = { enable = true },
	indent = { enable = false },

	autotag = {
		enable = true,
	},

	refactor = {
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<A-]>",
				goto_previous_usage = "<A-[>",
			},
		},
	},
})

-- include presence and its config
require("presence"):setup({
	enable_line_number = false,
	main_image = "file",
	neovim_image_text = "Its Neovim buddy!!!",
	debounce_timeout = 10,
})

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- lua, default settings
require("better_escape").setup({
	mapping = { "jk", "jj" }, -- a table with mappings to use
	timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
	clear_empty_lines = false, -- clear line after escaping if there is only whitespace
	keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
	-- example(recommended)
	-- keys = function()
	--   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
	-- end,
})

require('ofirkai').setup {
}

