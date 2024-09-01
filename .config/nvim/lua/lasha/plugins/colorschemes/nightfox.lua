return {
    "EdenEast/nightfox.nvim",
    opts = {
      transparent_background = false;
      gamma = 1.00, -- adjust the brightness of the theme
      styles = {
          comments = { italic = true },
          keywords = { italic = false },
          identifiers = { italic = false },
          functions = {},
          variables = {},
      },
      custom_highlights = {} or function(highlights, palette) return {} end,
      custom_palette = {} or function(palette) return {} end,
      terminal_colors = true,
    },
    config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
    end,
}

