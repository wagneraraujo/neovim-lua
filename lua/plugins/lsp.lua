

local tsserver = "tsserver"
local bin_tsserver = "typescript-language-server"
local servers = {
	"bashls",
	"cssls",
	"html",
	"rust_analyzer",
	"sumneko_lua",
	"tailwindcss",
	"tsserver",
}
local has_formatter = { "html", "rust_analyzer", "sumneko_lua", "tsserver" }


local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require'lspconfig'.clangd.setup{}
require'lspconfig'.tsserver.setup{}
require "lsp_signature".setup()
vim.o.completeopt = 'menuone,noselect'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local cmp = require'cmp'
local luasnip = require("luasnip")

local lspkind = require('lspkind')
local source_mapping = {
  buffer = "◉ Buffer",
  nvim_lsp = "👐 LSP",
  nvim_lua = "🌙 Lua",
  cmp_tabnine = "💡 Tabnine",
  path = "🚧 Path",
  luasnip = "🌜 LuaSnip"
}

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = ''
      end
      vim_item.menu = menu
      return vim_item
    end
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {

    ['<C-1>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-2'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-g>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-x>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),

    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
})

require("luasnip/loaders/from_vscode").load()

-- for _, name in pairs(servers) do
-- 	local found, server = require("nvim-lsp-installer").get_server(name)
-- 	if found and not server:is_installed() then
-- 		print("Installing " .. name)
-- 		server:install()
-- 	end
-- end
-- local setup_server = {
-- 	sumneko_lua = function(opts)
-- 		opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
-- 	end,
-- }
require("nvim-lsp-installer").on_server_ready(function(server)
	local opts = {
		on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			local opts = { buffer = bufnr }
			vim.keymap.set("n", "<Leader>h", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<Leader>i", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
			local should_format = true
			for _, value in pairs(has_formatter) do
				if client.name == value then
					should_format = false
				end
			end
			if not should_format then
				client.resolved_capabilities.document_formatting = false
			end
		end,
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}
	server:setup(opts)
end)



require("nvim-autopairs").setup {}

