-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "texlab", "pylsp", "angularls", "zls", "typst-lsp", }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
lspconfig.pylsp.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.typst_lsp.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "typst" },
  settings = {
    exportPdf = "onType",
    serverPath = "/usr/bin/tinymist"
  }
}
-- }
-- lspconfig.texlab.setup {
--   on_attach = on_attach,
--     if vim.api.nvim_buf_get_name(0) and vim.fn.expand("%:e:r") == ".tex" then
--       capabilities.documentSymbol = true
--       capabilities.completion = true
--       capabilities.hover = true
--     end,
-- }
