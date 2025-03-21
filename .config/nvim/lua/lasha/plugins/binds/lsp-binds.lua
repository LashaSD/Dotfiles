local opts = { noremap = true, silent = true }
local keymap = vim.keymap;

local function NextDiagnostic(opts_)
    opts_ = opts_ or {}
    if vim.diagnostic.jump ~= nil then
        return vim.diagnostic.jump(vim.tbl_deep_extend('force', opts_, {
            count = 1;
            float = true;
        }));
    else
        return vim.diagnostic.goto_prev(vim.tbl_deep_extend('force', opts_, {
            count = -1;
            float = true;
        }));
    end
end

local function PrevDiagnostic(opts_)
    opts_ = opts_ or {}
    if vim.diagnostic.jump ~= nil then
        return vim.diagnostic.jump(vim.tbl_deep_extend('force', opts_, {
            count = -1;
            float = true;
        }));
    else
        return vim.diagnostic.goto_next(vim.tbl_deep_extend('force', opts_, {
            count = -1;
            float = true;
        }));
    end
end

local function CustomSignatureHelp(_opts)
    _opts = _opts or {};
    return vim.lsp.buf.signature_help(vim.tbl_deep_extend('force', _opts, {
        border = "single";
    }))
end

local function CustomHover(opts_)
    opts_ = opts_ or {};
    return vim.lsp.buf.hover(vim.tbl_deep_extend('force', opts_, {
        border = "single";
    }));
end

local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = _border
    }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = _border
    }
)

vim.diagnostic.config{
    float={border=_border}
}

local function DiagnosticsOn()
    vim.diagnostic.enable(true)
end

local function DiagnosticsOff()
    vim.diagnostic.enable(false)
end

local function on_attach(client, bufnr)
    opts.buffer = bufnr

    local function map(mode, bind, fun, desc)
        opts.desc = desc;
        keymap.set(mode, bind, fun, opts);
    end

    map("n", "<leader>gd", vim.lsp.buf.definition, "Go To Definition")
    map("n", "<leader>gt", vim.lsp.buf.type_definition, "Go To Type Definition")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Smart Rename")
    map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show Buffer Diagnostics")
    map("n", "<leader>d", vim.diagnostic.open_float, "Show Line Diagnostics")
    map("n", "[d", NextDiagnostic, "Jump To Next Diagnostic")
    map("n", "]d", PrevDiagnostic, "Jump To Previous Diagnostic")
    map("n", "K", CustomHover, "Show Docs For Symbols Under The Cursor")
    map("n", "<leader>rs", ":LuauLsp restart<CR>", "Restart The LSP")
    map("n", "<leader>gs", CustomSignatureHelp, "LSP Function Signature Help");
    map("n", "<leader>gr", vim.lsp.buf.references, "Quickfix list of the references");
    vim.api.nvim_create_user_command('DiagnosticsOn', DiagnosticsOn, {})
    vim.api.nvim_create_user_command('DiagnosticsOff', DiagnosticsOff, {})
end

return {
    on_attach = on_attach
}
