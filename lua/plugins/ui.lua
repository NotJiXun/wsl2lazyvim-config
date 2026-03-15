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
  -- 1. THE TRANSPARENCY ENGINE (Forces transparency on any theme)
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },

  -- 2. THEMES
  { "folke/tokyonight.nvim", opts = { style = "night" } },
  { "ellisonleao/gruvbox.nvim", name = "gruvbox", opts = { contrast = "hard" } },
  { "catppuccin/nvim", name = "catppuccin" },
  { "rebelot/kanagawa.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },

  -- 3. DEFAULT THEME SETTING
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- 4. THE DASHBOARD
  {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
      dashboard = {
        enabled = true,
        preset = { header = sharp_logo },
        sections = {
          { section = "header", padding = 0, align = "left" },
          { section = "keys", gap = 0, padding = 1, align = "left" },
          { section = "recent_files", title = "Recent Files", limit = 5, padding = 1, align = "left" },
          { section = "startup", align = "left" },
        },
      },
    },
  },

  -- 5. Crazy ASF smear cursor(fire hazard)
  {
    "sphamba/smear-cursor.nvim",
    cond = function()
      return vim.g.neovide == nil
    end,
    opts = {
      cursor_color = "#ff4000", -- Bright fire orange
      particles_enabled = true, -- Enables the sparks/fire effect
      particle_spread = 1, -- How much the fire spreads out
      stiffness = 0.5, -- Lower = more elastic/wild movement
      trailing_stiffness = 0.2, -- Makes the tail linger longer
      trailing_exponent = 5, -- Shapes the fire trail
      damping = 0.6, -- More "bouncy" fire
      gamma = 1, -- Intense color brightness
      hide_target_hack = true, -- Hides the real cursor so it's just fire
    },
  },
}
