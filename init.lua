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
require("plugins.configs.lsp-config.emmet-lsp")
require("plugins.configs.telescope")
require("plugins.gitsigns")

local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
	'sqls',
	  'html',
  'cssls',
	'graphql',
	'jsonls',
	'prismals',
	'tailwindcss'

})
lsp.setup()

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})
