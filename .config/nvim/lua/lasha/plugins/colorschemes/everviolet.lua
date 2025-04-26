return {
    "everviolet/nvim",
    name = "everviolet",
    config = function()
        require("evergarden").setup {
            theme = {
                variant = 'winter',
                accent = 'green',
            },
            editor = {
                transparent_background = false,
                override_terminal = true,
                sign = { color = 'none' },
                float = {
                    color = 'mantle',
                    invert_border = false,
                },
                completion = {
                    color = 'surface0',
                },
            },
            style = {
                tabline = { 'reverse' },
                search = { 'reverse' },
                incsearch = { 'reverse' },
                types = { },
                keyword = { },
                comment = { },
            },
            overrides = {},
            color_overrides = {},
        }
    end
}
