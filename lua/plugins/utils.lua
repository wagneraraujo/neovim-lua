-- Para nvim-web-devicons
require'nvim-web-devicons'.get_icons()
require'colorizer'.setup()
-- require('telescope').load_extension('ag')


-- require("bufferline").setup{
--
-- }


--identacao
vim.opt.list = true

require("indent_blankline").setup {
    show_end_of_line = true,
}


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


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}



require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
	 matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    -- [options]
  },
	  ensure_installed = "all",
		  highlight = {
    enable = true,
    disable = { "lua" },
		additional_vim_regex_highlighting = { 'typescript' },
  },
  indent = {
    enable = true
  },

}

	--themes config 

require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'tokyonight'
    -- ... your lualine config
  }
}
-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd [[colorscheme nightfly]]
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()
-- vim.g.catppuccin_flavour = "frappe"
-- vim.cmd "colorscheme catppuccin"
-- end themes config
require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}
-- include treesitter and its config
require('nvim-treesitter.configs').setup{

  context_commentstring = {
    enable = true
  },
  ensure_installed = {'lua', 'typescript',
                      'regex', 'bash', 'cmake', 'css', 'javascript',
                      'html', 'comment', 'rust',  'markdown',
                      'make', 'json', 'vim'},
  highlight = {
    enable = true,
    disable = {},
  },

  rainbow = {
    enable = false,
    -- disable = { 'jsx', 'cpp' },
    extended_mode = true,
    max_file_lines = nil,
    -- colors = {},
    -- termcolors = {}
  },

  autotag = {
    enable = true,
  },

  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = 'grr',
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = 'gnd',
        list_definitions = 'gnD',
        list_definitions_toc = 'gO',
        goto_next_usage = '<A-]>',
        goto_previous_usage = '<A-[>',
      },
    },
  },
}

-- include presence and its config
require('presence'):setup({
    enable_line_number = false,
    main_image = 'file',
    neovim_image_text = 'Its Neovim buddy!!!',
    debounce_timeout = 10,
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
