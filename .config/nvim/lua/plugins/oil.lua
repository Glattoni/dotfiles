local add = MiniDeps.add

add({
  source = "stevearc/oil.nvim",
  depends = { "echasnovski/mini.icons" },
})

require("oil").setup()
