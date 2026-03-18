-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Make Tab 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- Neovide configuration
if vim.g.neovide then
  -- Font set to h1
  -- vim.o.guifont = "CaskaydiaCove NF:h11"

  vim.o.guifont = "JetBrainsMono NF:h11"

  -- Modern Transparency (80% opacity)
  vim.g.neovide_background_color = "#0f1117" .. string.format("%x", math.floor(255 * 0.8))
  vim.g.neovide_window_blurred = true

  -- Leave cursor settings at their defaults (no vfx_mode or animation overrides)
  vim.g.neovide_confirm_quit = true
end

-- Fix for Monokai Pro Classic startup
vim.g.lazyvim_colorscheme = "monokai-pro-classic"
