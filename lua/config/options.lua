-- 1. TAB & INDENTATION
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- 2. NAVIGATION & UI (THE FIX)
vim.opt.cursorline = false -- This stops the line from changing color when moving j/k
vim.opt.number = true -- Keeps line numbers on the left
vim.opt.relativenumber = true -- Good for Vim motions (jumping 5j, 10k, etc.)

-- 3. NEOVIDE CONFIGURATION
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono NF:h11"
  vim.g.neovide_opacity = 1.0
  vim.g.neovide_window_blurred = false
  vim.g.neovide_refresh_rate = 165
  vim.g.neovide_no_idle = true
  vim.g.neovide_confirm_quit = true

  -- Smoothness for 180+ WPM
  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_trail_size = 0.2
end

-- 4. THEME LOCK
vim.g.colors_name = "kanagawa"
