local sharp_logo = [[
                                                     
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
                                                     ]]

return {
  -- 1. THE TRANSPARENCY ENGINE (The Toggle)
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "Terminal",
        "Pmenu",
        "FloatBorder",
      },
    },
  },

  -- 2. TOKYONIGHT (The "Moon" Variant)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- The deep blue "Moon" look
      transparent = true, -- Native transparency support
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },

  -- 3. THE DASHBOARD (Snacks.nvim)
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
