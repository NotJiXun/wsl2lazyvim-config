-- Define the master transparency toggle (Default: false)
if _G.transparent_enabled == nil then
  _G.transparent_enabled = false
end

local sharp_logo = [[
                                                                        
                                                                       
        ████ ██████           █████      ██                     
       ███████████             █████                             
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
    opts = {
      style = "night",
      transparent = _G.transparent_enabled,
      styles = {
        sidebars = _G.transparent_enabled and "transparent" or "dark",
        floats = _G.transparent_enabled and "transparent" or "dark",
      },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    opts = {
      transparent_mode = _G.transparent_enabled,
      contrast = "hard",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = { transparent_background = _G.transparent_enabled },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = { transparent = _G.transparent_enabled },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = { styles = { transparency = _G.transparent_enabled } },
  },

  -- 2. SET THE DEFAULT PERMANENTLY
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },

  -- 3. SMEAR CURSOR
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },

  -- 4. THE FULL DASHBOARD (Now Left-Aligned)
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
          { section = "header", padding = 0, align = "left" },
          { section = "keys", gap = 0, padding = 1, align = "left" },
          { section = "recent_files", title = "Recent Files", limit = 5, padding = 1, align = "left" },
          { section = "startup", align = "left" },
        },
      },
    },
  },
}
