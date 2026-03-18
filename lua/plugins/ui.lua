local sharp_logo = [[
                                                     
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
                                                     ]]

return {
  -- 1. KANAGAWA (With Compiled Overrides)
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = true, -- REMEMBER: Run :KanagawaCompile after saving!
      undercurl = true,
      transparent = false,
      theme = "wave",
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Kill the "Highlight Square" by making backgrounds match the editor
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none", fg = theme.ui.float_border },
          FloatTitle = { bg = "none" },

          -- Specifically nuke Noice's boxy highlights
          NoiceCmdlinePopup = { bg = "none" },
          NoiceCmdlinePopupBorder = { bg = "none", fg = theme.ui.float_border },

          -- Ensure completion menu is also clean
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
        }
      end,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd("colorscheme kanagawa")
    end,
  },

  -- 2. NOICE (Restored to the "Nice" Floating Look)
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline_popup", -- Back to the floating bar you like
      },
      views = {
        cmdline_popup = {
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            -- Links Noice highlights to our new clean Kanagawa overrides
            winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
          },
        },
      },
    },
  },

  -- 3. ADDITIONAL THEMES
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "folke/tokyonight.nvim", priority = 1000, opts = { style = "moon" } },

  -- 4. THE DASHBOARD (Snacks.nvim)
  {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
      dashboard = {
        enabled = true,
        preset = { header = sharp_logo },
        width = 60,
        sections = {
          { section = "header", padding = 1, align = "center" },
          { section = "keys", gap = 0, padding = 1, align = "left" },
          { section = "recent_files", title = "Recent Files", limit = 5, padding = 1, align = "left" },
          { section = "startup", align = "left" },
        },
      },
    },
  },
}
