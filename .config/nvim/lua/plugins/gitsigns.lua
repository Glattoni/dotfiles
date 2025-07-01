local add = MiniDeps.add

add({
  source = "lewis6991/gitsigns.nvim",
})

require("gitsigns").setup()
