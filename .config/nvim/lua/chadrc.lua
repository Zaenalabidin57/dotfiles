-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  transparency = true,

  view = {
    side = "right",
  },
  tabufline = {
    order = { "buffers", "tabs", "btns", "treeOffset" },
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true, fg ="green" },
  },
  cmp = {
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = false,
    },
  },
  telescope = { style = "borderless" },
}
M.base46 = {
  theme = "catppuccin",
  transparency = true,
  hl_override = {
    Comment = { italic = true, fg ="dark_purple"},
    ["@comment"] = { italic = true, fg ="dark_purple"},
  },
  theme_toggle = {"catppuccin", "tokyonight"},
}

M.nvdash = {
  load_on_startup = true,
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dt"] = { "<cmd> DapTerminate <CR>", "Terminate" },
    ["<leader>dc"] = { "<cmd> DapContinue <CR>", "Continue" },
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle Breakpoint" },
  },
}
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

return M
