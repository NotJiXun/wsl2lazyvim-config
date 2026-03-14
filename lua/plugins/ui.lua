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
      colorscheme = "tokyonight-night",
    },
  },

  -- 4. SMEAR CURSOR
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },

  -- 5. THE DASHBOARD
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
}
