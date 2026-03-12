-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle Transparency
vim.keymap.set("n", "<leader>ut", function()
  _G.transparent_enabled = not _G.transparent_enabled
  -- Reload the colorscheme to apply changes instantly
  vim.cmd("colorscheme " .. vim.g.colors_name)
  print("Transparency: " .. (_G.transparent_enabled and "ON" or "OFF"))
end, { desc = "Toggle Transparency" })
