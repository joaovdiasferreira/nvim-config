
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}

})


require("mason-lspconfig").setup({


	ensure_installed = { "lua_ls", "clangd", "pyright", "html", "cssls", "tsserver" },


	automatic_installation = true;
})


-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").lua_ls.setup{
	settings = {
		Lua = {
			diagnostics = { globals	= {'vim'}}
		}
	}
}
require("lspconfig").clangd.setup{}
require("lspconfig").pyright.setup{}
require("lspconfig").html.setup{}
require("lspconfig").cssls.setup{}
require("lspconfig").arduino_language_server.setup{}
--require("lspconfig").rust_analyzer.setup {}
-- ...
