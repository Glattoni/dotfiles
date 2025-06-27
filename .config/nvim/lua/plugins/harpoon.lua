local add = MiniDeps.add

add({
  source = "ThePrimeagen/harpoon",
  depends = { "nvim-lua/plenary.nvim" },
  checkout = "harpoon2",
})

require("harpoon"):setup({})
