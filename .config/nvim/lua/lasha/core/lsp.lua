local function rojo_project(bufnr)
    return vim.fs.root(bufnr, function(name)
        return name:match ".+%.project%.json$"
    end)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

vim.lsp.config["luau-lsp"] = {
    cmd = {
        "luau-lsp", "lsp",
        "--definitions", "./globalTypes.d.lua",
        "--flag:LuauSolverV2=True",
    },
    capabilities = capabilities,
    filetypes = { "luau" },
    settings = {
        ["luau-lsp"] = {
            platform = { type = "roblox" },
            root_markers = { ".git", "sourcemap.json" },
            sourcemap = {
                enabled = true,
                autogenerate = false,
                sourcemapFile = "sourcemap.json",
            },
            fflags = {
                enable_new_solver = true,
            },
        }
    },
    root_dir = function(bufnr, on_dir)
        on_dir(rojo_project(bufnr));
    end,
};

vim.lsp.enable("luau-lsp");
