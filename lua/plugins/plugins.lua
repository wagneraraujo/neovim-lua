vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("terroo/vim-simple-emoji")
	use("navarasu/onedark.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

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
	use("windwp/nvim-autopairs")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	--[[ use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline' ]]
	-- use 'saadparwaiz1/cmp_luasnip'
	-- use 'L3MON4D3/LuaSnip'
	-- use 'rafamadriz/friendly-snippets'
	-- use 'ray-x/lsp_signature.nvim'
	-- use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
	-- use 'onsails/lspkind-nvim'
	-- use "williamboman/nvim-lsp-installer"
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use("tpope/vim-fugitive")
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- Navigation
	use("justinmk/vim-sneak")
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
	use("dense-analysis/ale")

	use("wakatime/vim-wakatime")
	--config for react
	use("AndrewRadev/tagalong.vim")
	use("sbdchd/neoformat")
	use("alvan/vim-closetag")
	use("leafOfTree/vim-matchtag")
	use("terrortylor/nvim-comment")
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
	-- use 'nvim-lua/plenary.nvim'
	--close buffer  security
	use("moll/vim-bbye")

	use("lewis6991/impatient.nvim")

	--themes
	use("folke/tokyonight.nvim")
	use("maxmellon/vim-jsx-pretty")

	use("karb94/neoscroll.nvim")
	use("p00f/nvim-ts-rainbow")

	use("Valloric/MatchTagAlways")
	use("mg979/vim-visual-multi")
	use({ "catppuccin/nvim", as = "catppuccin" })

	use("b3nj5m1n/kommentary")
	use("andweeb/presence.nvim")
	use("WhoIsSethDaniel/toggle-lsp-diagnostics.nvim")

	--live server
	use("bluz71/vim-nightfly-guicolors")
	use({ "turbio/bracey.vim", run = "cd app & npm install --prefix server" })

	use({ "kelly-lin/telescope-ag", requires = { { "nvim-telescope/telescope.nvim" } } })
	use("aca/emmet-ls")
	use("mattn/emmet-vim")
	use("kaiuri/nvim-juliana")
	use({ "williamboman/mason.nvim" })
	use("antoinemadec/FixCursorHold.nvim")

	-- lua with packer.nvim
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
end)
