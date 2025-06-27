vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Lsp actions",
  callback = function(event)
    local options = { buffer = event.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, options)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({ border = "rounded" })
    end, options)
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost", "LspAttach" }, {
  desc = "Linting",
  callback = function()
    require("lint").try_lint()
  end,
})
