return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"luau_lsp",
			},
			automatic_installation = true,
		})
		require("mason-lspconfig").setup_handlers({
			luau_lsp = function()
				require("luau-lsp").setup({})
			end,
		})
	end,
}
