-- Cycle through color themes that save not only on runtime
vim.keymap.set("n", "<leader>uc", "<cmd>lua _G.cycle_theme()<cr>", { desc = "Cycle Theme" })

-- Format current file with prettier (via conform.nvim)
vim.keymap.set({ "n", "v" }, "<leader>fp", function()
  require("conform").format({ formatters = { "prettier" }, lsp_fallback = false }, function(err)
    if err then
      vim.notify("Prettier: " .. err, vim.log.levels.ERROR)
    else
      vim.notify("Formatted with Prettier", vim.log.levels.INFO)
    end
  end)
end, { desc = "Format with Prettier" })
