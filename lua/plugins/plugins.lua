local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

--
-- vim.cmd([[packadd packer.nvim]])
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("navarasu/onedark.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "kelly-lin/telescope-ag", requires = { { "nvim-telescope/telescope.nvim" } } })

	use("kyazdani42/nvim-web-devicons")
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
	use("hrsh7th/cmp-buffer")
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
	use("dense-analysis/ale")

	use("wakatime/vim-wakatime")
	--config for react
	use("AndrewRadev/tagalong.vim")
	use("sbdchd/neoformat")
	use("alvan/vim-closetag")
	use("leafOfTree/vim-matchtag")
	-- use("terrortylor/nvim-comment")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- use({ "kristijanhusak/vim-js-file-import", run = "npm install" })

	--[[ use({
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup()
		end,
	}) ]]

	use("windwp/nvim-ts-autotag")

	use("ludovicchabant/vim-gutentags")
	--close buffer  security
	use("moll/vim-bbye")

	use("lewis6991/impatient.nvim")

	--themes
	use("folke/tokyonight.nvim")
	use("maxmellon/vim-jsx-pretty")

	use("p00f/nvim-ts-rainbow")

	use("mg979/vim-visual-multi")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- use("b3nj5m1n/kommentary")
	use("andweeb/presence.nvim")
	use("WhoIsSethDaniel/toggle-lsp-diagnostics.nvim")

	--live server

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
	-- use({
	-- 	"VonHeikemen/lsp-zero.nvim",
	-- 	requires = {
	-- 		-- LSP Support
	-- 		{ "neovim/nvim-lspconfig" },
	-- 		{ "williamboman/mason.nvim" },
	-- 		{ "williamboman/mason-lspconfig.nvim" },
	--
	-- 		-- Autocompletion
	-- 		{ "hrsh7th/nvim-cmp" },
	-- 		{ "hrsh7th/cmp-buffer" },
	-- 		{ "hrsh7th/cmp-path" },
	-- 		{ "saadparwaiz1/cmp_luasnip" },
	-- 		{ "hrsh7th/cmp-nvim-lsp" },
	-- 		{ "hrsh7th/cmp-nvim-lua" },
	--
	-- 		-- Snippets
	-- 		{ "L3MON4D3/LuaSnip" },
	-- 		{ "rafamadriz/friendly-snippets" },
	-- 	},
	-- })
	use("onsails/lspkind-nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("williamboman/mason-lspconfig.nvim")

	use({ "neovim/nvim-lspconfig" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-path" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })

	use("Valloric/MatchTagAlways")

	--[[ use({ "mfussenegger/nvim-jdtls", ft = { "java" } })
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }) ]]
	-- use({
	-- 	"projekt0n/github-nvim-theme",
	-- 	config = function()
	-- 		require("github-theme").setup({})
	-- 	end,
	-- })
	-- Lua
	use("ofirgall/ofirkai.nvim")
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	use({ "chentoast/marks.nvim" })

	-- Lua
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"gelguy/wilder.nvim",
	})

	use({
		"ray-x/navigator.lua",
		requires = {
			{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("navigator").setup({
				mason = true,
				lsp = {
					tsserver = {
						cmd = {
							"~/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/bin/tsserver",
						},
					},
					-- e.g. tsserver = { cmd = {'/home/username/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/bin/tsserver'} }
				},
			})
		end,
	})

	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})

	-- Lua
	use({
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup({
				tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
				default_shift_tab = "<C-d>", -- reverse shift default action,
				enable_backwards = true, -- well ...
				completion = true, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
				exclude = {}, -- tabout will ignore these filetypes
			})
		end,
		wants = { "nvim-treesitter" }, -- or require if not used so far
		after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
	})
	use("karb94/neoscroll.nvim")
	-- use({
	-- 	"melkster/modicator.nvim",
	-- 	after = "onedark.nvim", -- Add your colorscheme plugin here
	-- 	config = function()
	-- 	end,
	-- })

	use({ "xiyaowong/nvim-cursorword" })
	use("sam4llis/nvim-tundra") -- packer.nvim
	use({ "gzagatti/vim-leuven-theme" })
	local async = require("plenary.async")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "ellisonleao/gruvbox.nvim" })
	use("lukas-reineke/cmp-under-comparator")
	use({ "tveskag/nvim-blame-line" })
	use({ "kristijanhusak/vim-js-file-import", run = "npm install" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
end)
