local sharp_logo = [[
                                                   
                                              ___  
                                           ,o88888 
                                        ,o8888888' 
                  ,:o:o:oooo.        ,8O88Pd8888"  
              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    
            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      
           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        
          , ..:.::o:ooOoOO8O888O8O,COCOO"          
         , . ..:.::o:ooOoOOOO8OOOOCOCO"            
          . ..:.::o:ooOoOoOO8O8OCCCC"o             
             . ..:.::o:ooooOoCoCCC"o:o             
             . ..:.::o:o:,cooooCo"oo:o:            
          `   . . ..:.:cocoooo"'o:o:::'            
          .`   . ..::ccccoc"'o:o:o:::'             
         :.:.    ,c:cccc"':.:.:.:.:.'              
       ..:.:"'`::::c:"'..:.:.:.:.:.'               
     ...:.'.:.::::"'    . . . . .'                 
    .. . ....:."' `   .  . . ''                    
  . . . ...."'                                     
  .. . ."'                                         
 .                                                 
                                                   
]]

-- Transparency flag
vim.g.transparency_enabled = false

-- Theme list (order: 1=kanagawa, 2=nord, 3=catppuccin, 4=tokyonight, 5=rose-pine)
local themes = { "kanagawa", "nord", "catppuccin", "tokyonight", "rose-pine" }

-- State file path
local state_file = vim.fn.stdpath("data") .. "/theme_state"

-- Load saved index
local function load_theme_index()
  local file = io.open(state_file, "r")
  if file then
    local idx = tonumber(file:read("*a"))
    file:close()
    if idx and idx >= 1 and idx <= #themes then
      return idx
    end
  end
  return 3 -- default to catppuccin
end

-- Save current index
local function save_theme_index(idx)
  local file = io.open(state_file, "w")
  if file then
    file:write(idx)
    file:close()
  end
end

local current_theme_index = load_theme_index()

-- Apply theme function
local function apply_theme()
  local theme = themes[current_theme_index]

  if theme == "kanagawa" then
    require("kanagawa").setup({
      compile = true,
      transparent = vim.g.transparency_enabled,
      theme = "wave",
      overrides = function(colors)
        local t = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none", fg = t.ui.float_border },
          FloatTitle = { bg = "none" },
          NoiceCmdlinePopup = { bg = "none" },
          NoiceCmdlinePopupBorder = { bg = "none" },
          Pmenu = { fg = t.ui.shade0, bg = "none" },
          PmenuSel = { fg = "none", bg = t.ui.bg_p2 },
          TelescopeTitle = { fg = t.ui.special, bold = true },
          TelescopePromptNormal = { bg = "none" },
          TelescopePromptBorder = { fg = t.ui.float_border, bg = "none" },
          TelescopeResultsNormal = { fg = t.ui.fg_dim, bg = "none" },
          TelescopeResultsBorder = { fg = t.ui.float_border, bg = "none" },
          TelescopePreviewNormal = { bg = "none" },
          TelescopePreviewBorder = { fg = t.ui.float_border, bg = "none" },
          NeoTreeNormal = { bg = "none" },
          NeoTreeNormalNC = { bg = "none" },
        }
      end,
    })
  elseif theme == "nord" then
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = vim.g.transparency_enabled
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false
  elseif theme == "catppuccin" then
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = vim.g.transparency_enabled,
      integrations = {
        treesitter = true,
        noice = true,
        telescope = true,
        neotree = true,
      },
    })
  elseif theme == "tokyonight" then
    require("tokyonight").setup({
      style = "moon",
      transparent = vim.g.transparency_enabled,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })
  elseif theme == "rose-pine" then
    require("rose-pine").setup({
      variant = "moon",
      dark_variant = "moon",
      disable_background = vim.g.transparency_enabled,
    })
  end

  -- Apply colorscheme
  vim.cmd("colorscheme " .. theme)

  -- Post-setup
  if theme == "kanagawa" then
    vim.cmd("KanagawaCompile")
  end

  if vim.g.transparency_enabled then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  end

  print("Theme: " .. theme .. (vim.g.transparency_enabled and " (transparent)" or ""))
end

-- Transparency toggle
_G.toggle_transparency = function()
  vim.g.transparency_enabled = not vim.g.transparency_enabled
  apply_theme()
end

-- Theme cycle
_G.cycle_theme = function()
  current_theme_index = (current_theme_index % #themes) + 1
  save_theme_index(current_theme_index)
  apply_theme()
end

-- Delayed theme application (to override LazyVim's default)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(apply_theme, 100)
  end,
})

return {
  -- 1. KANAGAWA
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  -- 2. NORD
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  -- 3. CATPPUCCIN
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  -- 4. TOKYONIGHT
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  -- 5. ROSE-PINE
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  -- 6. NOICE
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.views = opts.views or {}
      opts.views.cmdline_popup = {
        border = { style = "rounded", padding = { 0, 1 } },
      }
      opts.views.popup = {}
      opts.presets = opts.presets or {}
      opts.presets.command_palette = true
      opts.presets.long_message_to_split = true
      return opts
    end,
  },
  -- 7. DASHBOARD – Compact keys (gap=0)
  {
    "folke/snacks.nvim",
    priority = 1000,
    opts = function(_, opts)
      opts.dashboard = vim.tbl_deep_extend("force", opts.dashboard or {}, {
        enabled = true,
        preset = { header = sharp_logo },
        sections = {
          { section = "header", padding = 1 },
          {
            section = "keys",
            gap = 0,
            padding = 0,
            items = {
              {
                action = "<cmd>Telescope find_files<cr>",
                key = "f",
                desc = "Find File",
                icon = " ",
              },
              {
                action = "<cmd>ene <bar> startinsert<cr>",
                key = "n",
                desc = "New File",
                icon = " ",
              },
              {
                action = "<cmd>Telescope projects<cr>",
                key = "p",
                desc = "Projects",
                icon = " ",
              },
              {
                action = "<cmd>Telescope live_grep<cr>",
                key = "t",
                desc = "Find Text",
                icon = " ",
              },
              {
                action = "<cmd>Telescope oldfiles<cr>",
                key = "r",
                desc = "Recent Files",
                icon = " ",
              },
              {
                action = "<cmd>e ~/.config/nvim/init.lua<cr>",
                key = "c",
                desc = "Config",
                icon = " ",
              },
              {
                action = "<cmd>lua require('persistence').load()<cr>",
                key = "s",
                desc = "Restore Session",
                icon = " ",
              },
              {
                action = "<cmd>LazyExtras<cr>",
                key = "x",
                desc = "Lazy Extras",
                icon = " ",
              },
              {
                action = "<cmd>Lazy<cr>",
                key = "l",
                desc = "Lazy",
                icon = "󰒲 ",
              },
              {
                action = "<cmd>qa<cr>",
                key = "q",
                desc = "Quit",
                icon = " ",
              },
            },
          },
          { section = "startup", padding = 1 },
        },
      })
      return opts
    end,
  },
}
