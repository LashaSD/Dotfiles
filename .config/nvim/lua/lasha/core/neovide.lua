vim.o.guifont = "IosevkaTerm Nerd Font:h16"

vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0

vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5

vim.g.neovide_show_border = true

vim.g.neovide_scroll_animation_length = 0.3
vim.g.neovide_scroll_animation_far_lines = 1

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_refresh_rate = 60
vim.g.neovide_no_idle = true

vim.g.neovide_cursor_animation_length = 0.025
vim.g.neovide_cursor_trail_size = 0.7
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_unfocused_outline_width = 0.075
vim.g.neovide_cursor_smooth_blink = false
vim.g.neovide_cursor_vfx_mode = "pixiedust"

local hl = vim.api.nvim_get_hl_by_name("Visual", true)
vim.api.nvim_set_hl(0, "Visual", { bg = hl.background, fg = hl.foreground, bold = false })

vim.keymap.set("n", "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true });
vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })

local rokit_dir = "/home/lasha/.rokit/bin/"
vim.env.PATH = rokit_dir .. ":" .. vim.env.PATH;
