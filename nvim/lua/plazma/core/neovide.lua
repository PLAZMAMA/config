if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_scroll_animation_length = 0.1

  vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

