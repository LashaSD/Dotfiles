return {
    "hedyhli/outline.nvim",
    config = function ()
        local outline = require("outline");
        outline.setup({
            outline_window = {
                -- winhl = "Normal:CustomHl", -- Custom highlight group for the outline window
            },
            preview_window = {
                -- winhl = "Normal:CustomHl", -- Custom highlight group for the preview window
            },
        });
    end
}
