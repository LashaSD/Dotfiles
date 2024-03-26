return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
        telescope.load_extension("fzf")
		telescope.setup({})
	end,
    keys = {
      {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files with Fuzzy Finder"},
      {"<leader>ft", "<cmd>Telescope<cr>", desc = "Telescope"},
      {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "View Current Buffers"} 
    }
}
