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

        local lsp_ids = { "lua_ls", "luau_lsp", "clangd", "ts_ls", "cssls", "omnisharp", "rust_analyzer" };
        mason_lspconfig.setup({
            ensure_installed = lsp_ids,
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

        local lsp_blacklist = { "lua_ls", "luau_lsp" };
        for _, value in ipairs(lsp_ids) do
            if not vim.tbl_contains(lsp_blacklist, value) then
                lspconfig[value].setup({
                    capabilities = capabilities,
                    on_attach = on_attach
                })
            end
        end

        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
    end,
}
