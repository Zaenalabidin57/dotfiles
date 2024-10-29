return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    lazy = false,
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {},
  },
  {
    "hrsh7th/nvim-cmp",
    -- commit = "6c84bc75c64f778e9f1dcb798ed41c7fcb93b639",
    opts = {
      sources = {
        { name = "supermaven" },
        { name = "codeium" },
        { name = "html-css" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp:null-ls" },
        { name = "nvim_lsp:lua-ls" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
      },
    },
    dependencies = {
      {
        "jcdickinson/codeium.nvim",
        enabled = true,
        event = "VeryLazy",
        config = function()
          require("codeium").setup {}
        end,
      },
    },
  },
  {
    "supermaven-inc/supermaven-nvim",
    enabled = false,
    config = function()
      require("supermaven-nvim").setup {}
    end,
  },
  {
    "folke/zen-mode.nvim",
    lazy = false,
    opts = {
      window = {
        backdrop = 1.0, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 120, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          signcolumn = "no", -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false, -- disable cursorline
          cursorcolumn = false, -- disable cursor column
          foldcolumn = "0", -- disable fold column
          list = false, -- disable whitespace characters
          showcmd = false,
          laststatus = 0,
        },
      },
      kitty = {
        enabled = true,
        font = "+5",
      },
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "folke/twilight.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    config = true,
    init = function()
      local possession = require "nvim-possession"
      vim.keymap.set("n", "<leader>sl", function()
        possession.list()
      end, { desc = "load sessions" })
      vim.keymap.set("n", "<leader>sn", function()
        possession.new()
      end, { desc = "new sessions" })
      vim.keymap.set("n", "<leader>su", function()
        possession.update()
      end, { desc = "update sessions" })
      vim.keymap.set("n", "<leader>sd", function()
        possession.delete()
      end, { desc = "delete sessions" })
      possession.sessions_path = "~/.local/share/nvim/sessions/"
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "lervag/vimtex",
    lazy = false,

    init = function()
      vim.g.maplocalleader = " "
      vim.g.main_tex_file = "main.tex"
      -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      --   pattern = "*.tex",
      --   callback = function()
      --     vim.cmd "VimtexCompile"
      --   end,
      -- })
    end,
    config = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
    end,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "andweeb/presence.nvim",
    lazy = false,
    config = function()
      require("presence").setup()
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      format = {
        -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
        -- view: (default is cmdline view)
        -- opts: any options passed to the view
        -- icon_hl_group: optional hl_group for the icon
        -- title: set to anything or empty string to hide
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
        -- lua = false, -- to disable a format, set to `false`
      },
      lsp = {

        override = {
          -- override the default lsp markdown formatter with Noice
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          -- override the lsp markdown formatter with Noice
          ["vim.lsp.util.stylize_markdown"] = false,
          -- override cmp documentation with Noice (needs the other options to work)
          ["cmp.entry.get_documentation"] = false,
        },
        signature = {
          enabled = false,
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    config = function ()
      require("notify").setup {
        background_colour = "#000000",
      }
    end,
    },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup {
        view = {
          side = "right",
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      vim.keymap.set("n", "<Leader>dt", "<cmd> DapTerminate <CR>", { desc = "Stop Debugging" })
      vim.keymap.set("n", "<Leader>dc", "<cmd> DapContinue <CR>", { desc = "debug Continue" })
      vim.keymap.set("n", "<Leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Breakpoint" })
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {desc = "debug toggle breakpoint"})
      -- vim.keymap.set("n", "<Leader>dc", dap.continue, {desc = "debug continue"})
    end,
  },
  {
    "Jezda1337/nvim-html-css",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("html-css"):setup()
    end,
  },
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require "multicursor-nvim"

      mc.setup()

      -- Add cursors above/below the main cursor.
      vim.keymap.set({ "n", "v" }, "<up>", function()
        mc.addCursor "k"
      end)
      vim.keymap.set({ "n", "v" }, "<down>", function()
        mc.addCursor "j"
      end)

      -- Add a cursor and jump to the next word under cursor.
      vim.keymap.set({ "n", "v" }, "<c-n>", function()
        mc.addCursor "*"
      end)

      -- Jump to the next word under cursor but do not add a cursor.
      vim.keymap.set({ "n", "v" }, "<c-s>", function()
        mc.skipCursor "*"
      end)

      -- Rotate the main cursor.
      vim.keymap.set({ "n", "v" }, "<left>", mc.nextCursor)
      vim.keymap.set({ "n", "v" }, "<right>", mc.prevCursor)

      -- Delete the main cursor.
      vim.keymap.set({ "n", "v" }, "<leader>x", mc.deleteCursor)

      -- Add and remove cursors with control + left click.
      vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)

      vim.keymap.set({ "n", "v" }, "<c-q>", function()
        if mc.cursorsEnabled() then
          -- Stop other cursors from moving.
          -- This allows you to reposition the main cursor.
          mc.disableCursors()
        else
          mc.addCursor()
        end
      end)

      vim.keymap.set("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        elseif mc.hasCursors() then
          mc.clearCursors()
        else
          -- Default <esc> handler.
        end
      end)

      -- Align cursor columns.
      vim.keymap.set("n", "<leader>a", mc.alignCursors)

      -- Split visual selections by regex.
      vim.keymap.set("v", "S", mc.splitCursors)

      -- Append/insert for each line of visual selections.
      vim.keymap.set("v", "I", mc.insertVisual)
      vim.keymap.set("v", "A", mc.appendVisual)

      -- match new cursors within visual selections by regex.
      vim.keymap.set("v", "M", mc.matchCursors)

      -- Rotate visual selection contents.
      vim.keymap.set("v", "<leader>t", function()
        mc.transposeCursors(1)
      end)
      vim.keymap.set("v", "<leader>T", function()
        mc.transposeCursors(-1)
      end)

      -- Customize how cursors look.
      vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
      vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
      vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
      vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    enable = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("harpoon").setup()
    end,
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon"):list():add()
        end,
        desc = " add harpoon",
      },
      {
        "<leader>rr",
        function()
          require("harpoon"):list():remove()
        end,
        desc = "remove harpoon",
      },
      {
        "<leader>rc",
        function()
          require("harpoon"):list():clear()
        end,
        desc = "clear harpoon",
      },
      {
        "<leader>q",
        function()
          local harpoon = require "harpoon"
          -- harpoon.mark.clear()
          -- harpoon.mark.add_file()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "harpoon to file 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "harpoon to file 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "harpoon to file 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "harpoon to file 4",
      },
      {
        "<leader>5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "harpoon to file 5",
      },
    },
  },
  {
    "nvchad/volt",
    enabled = true,
    lazy = true,
  },
  {
    "nvchad/minty",
    lazy = true,
  },
  {
    "j-hui/fidget.nvim",
    lazy = true,
  },
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy=false,
  },
  -- {
  --     "OXY2DEV/markview.nvim",
  --     enable = false,
  --     lazy = false,      -- Recommended
  --     -- ft = "markdown" -- If you decide to lazy-load anyway
  --     config = function()
  --       require("markview").setup({
  --         latex = {
  --       enable = true,
  --
  --       brackets = {
  --           enable = true,
  --           opening = {
  --               { "(", "MarkviewHeading1Sign" },
  --               { "{", "MarkviewHeading2Sign" },
  --               { "[", "MarkviewHeading3Sign" },
  --           },
  --           closing = {
  --               { ")", "MarkviewHeading1Sign" },
  --               { "}", "MarkviewHeading2Sign" },
  --               { "]", "MarkviewHeading3" },
  --           },
  --
  --           -- scope = {
  --           --  "DiagnosticVirtualTextError",
  --           --  "DiagnosticVirtualTextOk",
  --           --  "DiagnosticVirtualTextWarn",
  --           -- }
  --       },
  --
  --       -- Hides $$ inside lines
  --       inline = {
  --           enable = true
  --       },
  --
  --       -- Highlights lines within $$ $$
  --       block = {
  --           hl = "Code",
  --           text = { " Latex ", "Special" }
  --       },
  --
  --       -- Symbols, e.g. \geq
  --       symbols = {
  --           enable = true,
  --           -- Your own set of symbols, e.g.
  --           -- {
  --           --   name = "symbol"
  --           -- }
  --           overwrite = {}
  --       },
  --
  --       subscript = {
  --           enable = true
  --       },
  --       superscript = {
  --           enable = true
  --       },
  --   }
  --       })
  --     end,
  --
  --     dependencies = {
  --         -- You will not need this if you installed the
  --         -- parsers manually
  --         -- Or if the parsers are in your $RUNTIMEPATH
  --         "nvim-treesitter/nvim-treesitter",
  --
  --         "nvim-tree/nvim-web-devicons"
  --     }
  -- },
  -- {
}
