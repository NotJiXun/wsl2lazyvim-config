local sharp_logo = [[
                                                                    
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
                                                                    ]]

return {
  -- 1. THE TRANSPARENCY ENGINE
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

  -- 2. MONOKAI PRO (Sublime Classic Configuration)
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
      terminal_colors = true,
      devicons = true,
      styles = {
        comment = { italic = true },
        keyword = { italic = true }, -- The classic Sublime Text 4 look
        functions = { italic = false },
      },
      filter = "classic", -- This forces the classic high-contrast Sublime palette
    },
    config = function(_, opts)
      require("monokai-pro").setup(opts)
      vim.cmd.colorscheme("monokai-pro-classic")
    end,
  },

  -- 3. THEMES LIST (Keeping your other favorites for quick swapping)
  { "doums/darcula", lazy = false, priority = 1000 },
  { "folke/tokyonight.nvim", opts = { style = "night" } },
  { "ellisonleao/gruvbox.nvim", name = "gruvbox", opts = { contrast = "hard" } },
  { "catppuccin/nvim", name = "catppuccin" },
  { "rebelot/kanagawa.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },

  -- 4. DEFAULT THEME SETTING
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro-classic",
    },
  },

  -- 5. THE DASHBOARD (Snacks.nvim)
  {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
      dashboard = {
        enabled = true,
        preset = { header = sharp_logo },
        -- This 'width' helps Snacks calculate the center point for the whole layout
        width = 60,
        sections = {
          -- Adding 'align = "center"' specifically to the header
          { section = "header", padding = 1, align = "center" },
          { section = "keys", gap = 0, padding = 1, align = "left" },
          { section = "recent_files", title = "Recent Files", limit = 5, padding = 1, align = "left" },
          { section = "startup", align = "left" },
        },
      },
    },
  },
}
