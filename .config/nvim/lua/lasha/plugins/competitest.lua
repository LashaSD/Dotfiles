return {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function() require('competitest').setup({
        testcases_directory = "./cases/",
        testcases_use_single_file = true,
        view_output_diff = true,
        compile_command = {
            c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
            cpp = { exec = "g++", args = { "-DLASHA_LOCAL", "-s", "-O3", "-o", "$(FNOEXT)", "$(FNAME)" } },
            rust = { exec = "rustc", args = { "$(FNAME)" } },
            java = { exec = "javac", args = { "$(FNAME)" } },
        },
        run_command = {
            py = { exec = "python3", args = { "$(FNAME)" }}
        }
    }) end,
    keys = {
        {"<leader>cl", "<cmd>CompetiTest receive testcases<cr>", desc = "Load Test Cases from the Browser" },
        {"<leader>ca", "<cmd>CompetiTest add_testcase<cr>", desc = "Add Test Cases Manually" },
        {"<leader>ce", "<cmd>CompetiTest edit_testcase<cr>", desc = "Runs the Test Cases" },
        {"<leader>cd", "<cmd>CompetiTest delete_testcase<cr>", desc = "Delete Test Cases" },
        {"<leader>cr", "<cmd>CompetiTest run<cr>", desc = "Runs the Test Cases" },
    },
}
