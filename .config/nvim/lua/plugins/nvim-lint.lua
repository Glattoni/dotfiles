local add = MiniDeps.add

add({
  source = "mfussenegger/nvim-lint",
})

require("lint").linters_by_ft = {
  lua = { "luacheck" },
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
}
