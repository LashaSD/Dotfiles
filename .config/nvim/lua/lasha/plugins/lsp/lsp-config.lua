return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
        --Setup Mason
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({})

		mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "luau_lsp",
                "clangd",
                "ts_ls",
                "cssls",
                "omnisharp"
			},
			automatic_installation = true,
		})

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = "", Warn = "", Hint = "", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local on_attach = require("lasha.plugins.binds.lsp-binds").on_attach
        local lspconfig = require("lspconfig")

        lspconfig["clangd"].setup({
          capabilities = capabilities,
          on_attach = on_attach
        })

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

        lspconfig["ts_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        });

        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        });

        lspconfig["omnisharp"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        });
	end,
}
