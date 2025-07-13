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
            },
            automatic_installation = false,
            automatic_enable = false,
        })

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = "", Warn = "", Hint = "", Info = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities();
        local on_attach = require("lasha.plugins.binds.lsp-binds").on_attach;
        local lspconfig = require("lspconfig");

        local function setup_safe(lsp_name, p_opts)
            local opts = p_opts or {};
            local lsp = lspconfig[lsp_name];
            if lsp ~= nil then
                lspconfig[lsp_name].setup(vim.tbl_deep_extend("force", {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }, opts));
            end
        end

        setup_safe("clangd", {
            cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed", "--pch-storage=memory" },
        });

        setup_safe("lua_ls", {
            settings = {
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

        setup_safe("ts_ls");
        setup_safe("cssls");
        setup_safe("omnisharp");
        setup_safe("zls");
    end,
}
