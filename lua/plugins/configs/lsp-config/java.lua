vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.cmdheight = 2 -- more space in the neovim command line for displaying messages

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end
capabilities.textDocument.completion.completionItem.snippetSupport = false
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end

-- Determine OS
local home = os.getenv("HOME")
if vim.fn.has("mac") == 1 then
	WORKSPACE_PATH = home .. "/projetos/"
	CONFIG = "mac"
elseif vim.fn.has("unix") == 1 then
	WORKSPACE_PATH = home .. "~/projetos/"
	CONFIG = "linux"
else
	print("Unsupported system")
end

-- Find root of project
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
	return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = WORKSPACE_PATH .. project_name

-- TODO: Testing

JAVA_DAP_ACTIVE = true

local bundles = {
	vim.fn.glob(
		"/home/dev/.config/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.43.0.jar",
		1
	),
}

if JAVA_DAP_ACTIVE then
	vim.list_extend(
		bundles,
		vim.split(vim.fn.glob(home), "\n")
	)
	-- vim.list_extend(
	-- 	bundles,
	-- 	vim.split(
	-- 		vim.fn.glob(
	-- 			home
	-- 			..
	-- 			"/home/dev/.config/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.43.0.jar"
	-- 		),
	-- 		"\n"
	-- 	)
	-- )
end

local config = {
	cmd = {

		-- 💀
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- 💀
		"-jar",
		"/home/dev/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.jdt.launching_3.19.800.v20220922-0905.jar",
		"-configuration",
		"/home/dev/.local/share/nvim/mason/packages/jdtls/config_linux" .. CONFIG,
		"-data",
		workspace_dir,
	},

	capabilities = capabilities,
	root_dir = root_dir,

	on_attach = function()
		vim.lsp.codelens.refresh()
		if JAVA_DAP_ACTIVE then
			require("jdtls").setup_dap({ hotcodereplace = "auto" })
			require("jdtls.dap").setup_dap_main_classsconfigs()
		end
	end,

	init_options = {
		bundles = bundles,
	},

	settings = {
		java = {
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all", -- literals, all, none
				},
			},
			format = {
				enabled = false,
			},
		},
		signatureHelp = { enabled = true },
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
		},
		contentProvider = { preferred = "fernflower" },
		extendedClientCapabilities = extendedClientCapabilities,
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
	},

	flags = {
		allow_incremental_sync = true,
	},
}

jdtls.start_or_attach(config)

require("jdtls").setup_dap()
require("jdtls.setup").add_commands()

vim.cmd(
	"command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
)
vim.cmd(
	"command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
)
vim.cmd("command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
-- vim.cmd "command! -buffer JdtJol lua require('jdtls').jol()"
vim.cmd("command! -buffer JdtBytecode lua require('jdtls').javap()")
-- vim.cmd "command! -buffer JdtJshell lua require('jdtls').jshell()"

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "<A-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
-- map("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
map("n", "sd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
map("i", "<A-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
map("n", "sp", "<Cmd>Lspsaga preview_definition<CR>", opts)
map("n", "sr", "<Cmd>Lspsaga rename<CR>", opts)
map("n", "<leader>la", "<Cmd>lua require('jdtls').code_action()<CR>", { silent = true })
