_G.__luacache_config = {
	chunks = {
		enable = true,
		path = vim.fn.stdpath("cache") .. "/luacache_chunks",
	},
	modpaths = {
		enable = true,
		path = vim.fn.stdpath("cache") .. "/luacache_modpaths",
	},
}
require("impatient")
require("basicneovim")
require("functions")
require("plugins.plugins")
require("tools")
require("themes")
require("keymaps")
require("plugins.utils")
require("plugins.nvimtree")
require("setthings")
require("plugins.complete")
require("plugins.configs.bufferline")
--[[ require("plugins.configs.lsp-config.cmpconfiglua")
require("plugins.configs.lsp-config.configlsp") ]]
require("plugins.configs.lsp-config.emmet-lsp")
--[[ require("plugins.configs.lsp-config.dap")
require("plugins.configs.lsp-config.java") ]]
require("plugins.configs.telescope")
require("plugins.gitsigns")

local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.setup()


