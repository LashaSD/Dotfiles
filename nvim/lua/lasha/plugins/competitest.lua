return {
	'xeluxee/competitest.nvim',
	dependencies = 'MunifTanjim/nui.nvim',
	config = function() require('competitest').setup({
      testcases_directory = "./cases/",
      testcases_use_single_file = true,
      view_output_diff = true
    }) end,
    keys = {
      {"<leader>cl", "<cmd>CompetiTest receive testcases<cr>", desc = "Load Test Cases from the Browser" },
      {"<leader>ca", "<cmd>CompetiTest add_testcase<cr>", desc = "Add Test Cased Manually" },
      {"<leader>cr", "<cmd>CompetiTest run<cr>", desc = "Runs the Test Cases" },
    },
}
