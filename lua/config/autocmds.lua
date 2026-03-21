-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Autosave every 15 seconds
vim.fn.timer_start(15000, function()
  vim.cmd("silent! wall")
end, { ["repeat"] = -1 }) -- -1 means repeat forever
