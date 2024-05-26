return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', "<leader>ff", builtin.find_files, { desc = "Find Files" });
        vim.keymap.set(
          "n",
          "<leader>fg",
          "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
          { desc = "Live Grep" }
        )
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })

		local telescope = require("telescope")
        telescope.setup({})

        -- telescope.load_extension("fzf")
	end,
}
