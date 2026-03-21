vim.keymap.set("n", "<leader>ut", "<cmd>lua _G.toggle_transparency()<cr>", { desc = "Toggle Transparency" })
vim.keymap.set("n", "<leader>uc", "<cmd>lua _G.cycle_theme()<cr>", { desc = "Cycle Theme" })

-- Format current file with prettier (via conform.nvim)
vim.keymap.set({ "n", "v" }, "<leader>fp", function()
  require("conform").format({ formatters = { "prettier" }, lsp_fallback = false })
end, { desc = "Format with Prettier" })
