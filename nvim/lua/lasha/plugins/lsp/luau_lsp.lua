return {
	"lopi-py/luau-lsp.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("luau-lsp").setup({
			sourcemap = {
				enabled = true,
				autogenerate = true, -- automatic generation when the server is attached
                rojo_path = "rojo",
				rojo_project_file = "default.project.json",
			},
			types = {
				roblox = true,
				roblox_security_level = "PluginSecurity",
			},
		})
	end,
}
