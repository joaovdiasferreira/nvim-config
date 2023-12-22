
local cmp = require'cmp'
require("luasnip.loaders.from_vscode").lazy_load()

local luasnip = require'luasnip'

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


local kind_icons = {
  Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
  Field = " ",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
  Snippet = "",
	Color = "󰏘",
	File = "󰈙",
  Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
  Struct = "",
	Event = "",
	Operator = "󰆕",
  TypeParameter = " ",
	Misc = " ",
}


cmp.setup({

	snippet = {
				-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.

		end,
		},


		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

			["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
		}),

	sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' }, -- For vsnip users.
      { name = 'buffer' },
			{ name = 'path' },
			{ name = 'nvim_lsp_signature_help' }
    })


	})

	-- `/` cmdline setup.
	cmp.setup.cmdline('/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})

	-- `:` cmdline setup.
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{
				name = 'cmdline',
				option = {
					ignore_cmds = { 'Man', '!' }
				}
			}
		})
	})


local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig")['clangd'].setup {
	capabilities = capabilities,
}
--require("lspconfig")['pyright'].setup {--
	--capabilities = capabilities,
--}
--require("lspconfig")['arduino_language_server'].setup {
--	capabilities = capabilities,
--}
