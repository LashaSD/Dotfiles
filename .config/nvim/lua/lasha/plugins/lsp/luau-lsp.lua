return {
    "lopi-py/luau-lsp.nvim",
    event = "BufReadPre",
    opts = {},
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local function rojo_project()
            return vim.fs.root(0, function(name)
                return name:match ".+%.project%.json$"
            end)
        end

        if rojo_project() then
            vim.filetype.add {
                extension = {
                    lua = function(path)
                        return path:match "%.nvim%.lua$" and "lua" or "luau"
                    end,
                },
            }
        end

        require("luau-lsp").setup({
            server = {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                on_attach = require("lasha.plugins.binds.lsp-binds").on_attach,
                settings = {
                    ["luau-lsp"] = {
                        completion = {
                            imports = {
                                enabled = true, -- enable auto imports
                            },
                        },
                    },
                },
            },
            sourcemap = {
                enabled = true,
                autogenerate = true,
                rojo_path = "rojo",
                rojo_project_file = "default.project.json",
            },
            types = {
                -- definitions = { "./" },
                roblox = true,
                roblox_security_level = "PluginSecurity",
            },
            plugin = {
                enabled = true,
                port = 3667,
            },
            platform = {
                type = rojo_project() and "roblox" or "standard",
            }
        })
    end,
}
