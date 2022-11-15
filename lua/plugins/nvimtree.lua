require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = true,
	   auto_close = true,
  diagnostics = {
    enable = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    }
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  system_open = {
    cmd  = nil,
    args = {}
  },

  view = {
    width = 30,
    side = 'right',
    mappings = {
      custom_only = false,
      list = {}
    }
  },
	 auto_resize = true,
	 signcolumn = "yes",
	  git = {
        enable = false
    },
		 update_focused_file = {
        enable = true,
        update_cwd = true
    },
		   filters = {
        dotfiles = true,
        custom = {"node_modules"}
    },
}

