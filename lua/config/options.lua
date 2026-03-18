-- 1. TAB & INDENTATION
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- 2. NEOVIDE CONFIGURATION
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono NF:h11"

  -- Modern Opacity (No warnings)
  vim.g.neovide_opacity = 0.8
  vim.g.neovide_window_blurred = true

  -- Performance for 180+ WPM
  vim.g.neovide_refresh_rate = 165
  vim.g.neovide_no_idle = true
  vim.g.neovide_confirm_quit = true
end

-- 3. THEME LOCK
vim.g.colors_name = "tokyonight-moon"
