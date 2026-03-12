local sharp_logo = [[
                                                                        
                                                                        
        ████ ██████            █████      ██                     
       ███████████              █████                             
       █████████ ███████████████████ ███   ███████████   
      █████████  ███    █████████████ █████ ██████████████   
     █████████ ██████████ █████████ █████ █████ ████ █████   
   ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                        ]]

return {
  -- 1. THEMES
  {
    "folke/tokyonight.nvim",
    opts = { transparent = true },
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    opts = {
      transparent_mode = true,
      contrast = "hard",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = { transparent_background = true },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = { transparent = true },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = { styles = { transparency = true } },
  },

  -- Set Gruvbox as the default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- 2. SMEAR CURSOR
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },

  -- 3. THE FULL DASHBOARD
  {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = sharp_logo,
        },
        sections = {
          { section = "header", padding = 0 },
          { section = "keys", gap = 0, padding = 1 },
          { section = "recent_files", title = "Recent Files", limit = 5, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
