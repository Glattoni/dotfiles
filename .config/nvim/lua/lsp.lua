vim.diagnostic.config({
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = {
    border = "rounded",
    source = true,
    header = "",
    prefix = "",
  },
})

vim.diagnostic.enable(true)

vim.lsp.enable("luals")
vim.lsp.enable("ts_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("emmet_ls")
