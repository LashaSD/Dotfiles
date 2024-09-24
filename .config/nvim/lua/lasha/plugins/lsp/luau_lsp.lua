return {
	"lopi-py/luau-lsp.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local keymap = vim.keymap;
        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Go To Definition"
			keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts) -- show documentation for what is under cursor

			opts.desc = "Go To Type Definition"
			keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts) -- show documentation for what is under cursor

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LuauLsp restart<CR>", opts) -- mapping to restart lsp if necessary
		end

        local capabilities = cmp_nvim_lsp.default_capabilities();

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
                capabilities = capabilities;
                on_attach = on_attach;
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
				autogenerate = true, -- automatic generation when the server is attached
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
