local sharp_logo = [[
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                        N E O V I M                         \/   `==
\   _-'                                                                `-_   /
 `''                                                                      ``' 
]]

return {
  -- 1. KANAGAWA (compiled + forced override after startup)
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = true,
      transparent = false,
      theme = "wave",
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none", fg = theme.ui.float_border },
          FloatTitle = { bg = "none" },
          NoiceCmdlinePopup = { bg = "none" },
          NoiceCmdlinePopupBorder = { bg = "none" },
          Pmenu = { fg = theme.ui.shade0, bg = "none" },
          PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = "none" },
          TelescopePromptBorder = { fg = theme.ui.float_border, bg = "none" },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = "none" },
          TelescopeResultsBorder = { fg = theme.ui.float_border, bg = "none" },
          TelescopePreviewNormal = { bg = "none" },
          TelescopePreviewBorder = { fg = theme.ui.float_border, bg = "none" },
          NeoTreeNormal = { bg = "none" },
          NeoTreeNormalNC = { bg = "none" },
        }
      end,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd("colorscheme kanagawa")
      vim.cmd("KanagawaCompile")
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.defer_fn(function()
            local colors = require("kanagawa.colors").setup()
            local theme = colors.theme
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = theme.ui.float_border })
            vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
            vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "none" })
            vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = "none" })
            vim.api.nvim_set_hl(0, "Pmenu", { fg = theme.ui.shade0, bg = "none" })
            vim.api.nvim_set_hl(0, "PmenuSel", { fg = "none", bg = theme.ui.bg_p2 })
            vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = theme.ui.special, bold = true })
            vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = theme.ui.float_border, bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { fg = theme.ui.fg_dim, bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = theme.ui.float_border, bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = theme.ui.float_border, bg = "none" })
            vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
          end, 50)
        end,
      })
    end,
  },

  -- 2. NOICE (win_options removed)
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

  -- 3. DASHBOARD (only header, recent files, and startup – safe padding)
  {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
      dashboard = {
        enabled = true,
        preset = { header = sharp_logo },
        sections = {
          { section = "header", padding = 1 }, -- one line above and below header
          { section = "recent_files", title = "Recent Files", limit = 3, padding = 0 }, -- no extra padding
          { section = "startup", padding = 1 }, -- one line above startup
        },
      },
    },
  },
}
