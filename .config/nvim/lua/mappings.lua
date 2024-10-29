require "nvchad.mappings"

-- add yours here
-- biji keras
local map = vim.keymap.set

vim.keymap.del("n", "<leader>h")
-- local harpoon_mark = require "harpoon.mark"
-- local harpoon_ui = require "harpoon.ui"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map("n", "<leader>q", ":q<CR>", { desc = "Keluar" })
-- map("n", "<leader>Q", ":wq<CR>", { desc = "Seve" })

vim.keymap.set("n", "<leader>tm", function()
  require("menu").open "default"
end, {desc = "klik kanan"})

vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

map("n", "<leader>fn", ":Telescope noice<CR>", {desc = "telescope noice"})
map("n", "<leader>cc", ":Codeium Chat<CR>", {desc = "Codeium Chat"})

map("n", "<leader>z", function()
  require("zen-mode").toggle {
    window = {
      width = 0.90, -- width will be 85% of the editor width
    },
  }
end, { desc = "Zen Mode" })
map("n", "<leader>sm", function()
  require("minty.huefy").open()
end, { desc = "color hueh" })
map("n", "<leader>ss", function()
  require("minty.shades").open()
end, { desc = "color shades" })

-- map("n", "<leader>a", require("harpoon.mark").add_file())
-- map("n", "<leader>a", harpoon_mark.add_file())
-- map("n", "<leader>jf", require("harpoon.ui").toggle_quick_menu())
-- map("n", "<leader>jd", require("harpoon.ui").nav_next)
-- map("n", "<leader>js", require("harpoon.ui").nav_prev)
-- map("n", "<leader>jt", ":Telescope harpoon marks<CR>", { desc = "Telescope harpoon marks" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
