vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	-- use("terroo/vim-simple-emoji")
	use("navarasu/onedark.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "kelly-lin/telescope-ag", requires = { { "nvim-telescope/telescope.nvim" } } })

	use("kyazdani42/nvim-web-devicons")
	--use 'tamton-aquib/staline.nvim'
	use("lukas-reineke/indent-blankline.nvim")
	use("norcalli/nvim-colorizer.lua")
	use({
		"ur4ltz/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "surround" })
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	--[[ use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp") ]]
	use("hrsh7th/cmp-buffer")
	-- use("L3MON4D3/LuaSnip")
	-- use("rafamadriz/friendly-snippets")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use("tpope/vim-fugitive")
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- Navigation
	-- use("justinmk/vim-sneak")
	use("akinsho/bufferline.nvim")
	-- Dashboard
	use({ "glepnir/dashboard-nvim" })

	use({
		"kyazdani42/nvim-tree.lua",
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	use({
		"nvim-lualine/lualine.nvim",
	})

	use("yamatsum/nvim-cursorline")
	-- use("dense-analysis/ale")

	use("wakatime/vim-wakatime")
	--config for react
	use("AndrewRadev/tagalong.vim")
	use("sbdchd/neoformat")
	use("alvan/vim-closetag")
	use("leafOfTree/vim-matchtag")
	-- use("terrortylor/nvim-comment")
	use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({ "kristijanhusak/vim-js-file-import", run = "npm install" })

	use({
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup()
		end,
	})

	use("windwp/nvim-ts-autotag")
	use("marko-cerovac/material.nvim")

	use("ludovicchabant/vim-gutentags")
	--close buffer  security
	use("moll/vim-bbye")

	use("lewis6991/impatient.nvim")

	--themes
	use("folke/tokyonight.nvim")
	use("maxmellon/vim-jsx-pretty")

	use("karb94/neoscroll.nvim")
	use("p00f/nvim-ts-rainbow")

	use("mg979/vim-visual-multi")
	use({ "catppuccin/nvim", as = "catppuccin" })

	use("b3nj5m1n/kommentary")
	use("andweeb/presence.nvim")
	use("WhoIsSethDaniel/toggle-lsp-diagnostics.nvim")

	--live server
	use("bluz71/vim-nightfly-guicolors")
	use({ "turbio/bracey.vim", run = "cd app & npm install --prefix server" })

	use("aca/emmet-ls")
	use("mattn/emmet-vim")
	use({ "williamboman/mason.nvim" })
	use("antoinemadec/FixCursorHold.nvim")

	use({
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	})

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use("Valloric/MatchTagAlways")

	use({ "mfussenegger/nvim-jdtls", ft = { "java" } })
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({})
		end,
	})
-- Lua

	use({
		"andersevenrud/nordic.nvim",
		config = function()
			-- The table used in this example contains the default settings.
			-- Modify or remove these to your liking (this also applies to alternatives below):
			require("nordic").colorscheme({
				-- Underline style used for spelling
				-- Options: 'none', 'underline', 'undercurl'
				underline_option = "none",

				-- Italics for certain keywords such as constructors, functions,
				-- labels and namespaces
				italic = true,

				-- Italic styled comments
				italic_comments = true,

				-- Minimal mode: different choice of colors for Tabs and StatusLine
				minimal_mode = true,

				-- Darker backgrounds for certain sidebars, popups, etc.
				-- Options: true, false, or a table of explicit names
				-- Supported: terminal, qf, vista_kind, packer, nvim-tree, telescope, whichkey
				alternate_backgrounds = true,

				-- Callback function to define custom color groups
				-- See 'lua/nordic/colors/example.lua' for example defitions
				custom_colors = function(c, s, cs)
					return {}
				end,
			})
		end,
	})
use { 
  'olivercederborg/poimandres.nvim',
  config = function()
    require('poimandres').setup {
      -- leave this setup function empty for default config
      -- or refer to the configuration section
      -- for configuration options
    }
  end
}
end)
