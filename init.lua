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

require("plugins.impatient")
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
require("plugins.configs.lsp-config.emmet-lsp")
require("plugins.configs.telescope")
require("plugins.gitsigns")
require("plugins.trouble")
require("plugins.gitconflict")
require("plugins.autopairs")
require("plugins.indentline")
require("illuminate")

-- lsp config
require("plugins.configs.lsp-config.configlsp")
require("plugins.configs.lsp-config.lspsaga")
require("plugins.configs.lsp-config.null")
require("plugins.configs.lsp-config.cmpconfiglua")
require("plugins.configs.lsp-config.lspkind")
require("plugins.configs.lsp-config.handlers")
require("plugins.configs.lsp-config.mason")
