require 'nvim-tree'.setup {
	disable_netrw      = true,
	hijack_netrw       = true,
	open_on_setup      = false,
	ignore_ft_on_setup = {},
	open_on_tab        = false,
	hijack_cursor      = false,
	update_cwd         = true,
	diagnostics        = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = '',
			info = '',
			warning = '',
			error = '',
		}
	},
	actions            = {
		open_file = {
			quit_on_open = true,
		},
	},
	system_open        = {
		cmd  = nil,
		args = {}
	},

	view = {
		width = 35,
		side = 'right',
		mappings = {
			custom_only = false,
			list = {}
		}
	},
	git = {
		enable = false
	},
	update_focused_file = {
		enable = true,
		update_cwd = true
	},
	filters = {
		dotfiles = false,
		custom = { "node_modules" }
	},
}
