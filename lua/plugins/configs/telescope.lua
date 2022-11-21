local telescope = require("telescope")
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
telescope.setup {
	pickers = {
		find_files = {
			theme = "dropdown",
		}
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
		}, fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	}
}


require("telescope").load_extension "ag"
require("telescope").load_extension "fzf"
