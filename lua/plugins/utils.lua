-- Para nvim-web-devicons
require("nvim-web-devicons").get_icons()
require("colorizer").setup()
require("Comment").setup({
	pre_hook = function()
		return require("ts_context_commentstring.internal").calculate_commentstring()
	end,
})
vim.opt.list = true

--lua line confsg
local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end
local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end
local location = {
	"location",
	padding = 0,
}
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { mode },
		lualine_c = {},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { progress },
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
		"tsx",
		"javascript",
		"html",
		"php",
		"markdown",
		"json",
		"vim",
		"java"
	},
	sync_install = true,
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false,
		max_file_lines = nil,
	},
	autopairs = { enable = true },
	incremental_selection = { enable = true },

	autotag = {
		enable = true,
	},
	indent = { enable = true, disable = { "python" } },

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
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
-- include presence and its config
require("presence"):setup({
	enable_line_number = false,
	main_image = "file",
	neovim_image_text = "Its Neovim buddy!!!",
	debounce_timeout = 10,
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

-- require("ofirkai").setup({})

require("toggleterm").setup({})

require("marks").setup({
	mappings = {
		set_next = "m,",
		next = "m]",
		preview = "m;",
		set_bookmark0 = "m0",
		prev = false, -- pass false to disable only this default mapping
	},
})

local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })
wilder.set_option(
	"renderer",
	wilder.wildmenu_renderer({
		-- highlighter applies highlighting to the candidates
		highlighter = wilder.basic_highlighter(),
		pumblend = 20,
	})
)
wilder.set_option(
	"renderer",
	wilder.renderer_mux({
		[":"] = wilder.popupmenu_renderer({
			highlighter = wilder.basic_highlighter(),
		}),
		["/"] = wilder.wildmenu_renderer({
			highlighter = wilder.basic_highlighter(),
		}),
	})
)
wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
		highlights = {
			border = "Normal", -- highlight to use for the border
		},
		-- 'single', 'double', 'rounded' or 'solid'
		-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
		border = "rounded",
	}))
)

require("gruvbox").setup({
	overrides = {
		Define = { link = "GruvboxPurple" },
		Macro = { link = "GruvboxPurple" },
		TSNote = { link = "GruvboxYellow" },
		TSConstBuiltin = { link = "GruvboxPurple" },
		CocCodeLens = { fg = "#878787" },
		ContextVt = { fg = "#878787" },
		Comment = { fg = "#fe8019", italic = true },
		Folded = { italic = true, fg = "#fe8019", bg = "#3c3836" },
		FoldColumn = { fg = "#fe8019", bg = "#0E1018" },
		DiffDelete = {
			bold = true,
			reverse = false,
			fg = "#442d30",
			bg = "#442d30",
		},
		DiffText = { bold = true, reverse = false, fg = "", bg = "#213352" },
		StatusLine = { bg = "#ffffff", fg = "#0E1018" },
		StatusLineNC = { bg = "#3c3836", fg = "#0E1018" },
		CursorLineNr = { fg = "#fabd2f", bg = "#0E1018" },
		CocWarningFloat = { fg = "#dfaf87" },
		CocInlayHint = { fg = "#87afaf" },
		DiagnosticVirtualTextWarn = { fg = "#dfaf87" },
		GruvboxOrangeSign = { fg = "#dfaf87", bg = "#0E1018" },
		GruvboxAquaSign = { fg = "#8EC07C", bg = "#0E1018" },
		GruvboxGreenSign = { fg = "#b8bb26", bg = "#0E1018" },
		GruvboxRedSign = { fg = "#fb4934", bg = "#0E1018" },
		GruvboxBlueSign = { fg = "#83a598", bg = "#0E1018" },
		WilderMenu = { fg = "#ebdbb2", bg = "#0E1018" },
		WilderAccent = { fg = "#f4468f", bg = "#0E1018" },
		highlight = { fg = "#0e1018", bg = "#fb4934" }, -- Optional
	},
})

require("neoscroll").setup({
	-- All these keys will be mapped to their corresponding default scrolling animation
	mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
	hide_cursor = true, -- Hide cursor while scrolling
	stop_eof = true, -- Stop at <EOF> when scrolling downwards
	respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	easing_function = nil, -- Default easing function
	pre_hook = nil, -- Function to run before the scrolling animation starts
	post_hook = nil, -- Function to run after the scrolling animation ends
	performance_mode = false, -- Disable "Performance Mode" on all buffers.
})

require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt" },
	map_cr = false,
	disable_in_macro = false,
	disable_in_visualblock = false,
})

