local add = MiniDeps.add

add({
  source = "zenbones-theme/zenbones.nvim",
  depends = { "rktjmp/lush.nvim" },
})

add({
  source = "webhooked/kanso.nvim",
})

require("kanso").setup({
  italics = false,
})

-- vim.cmd.colorscheme("zenwritten")
vim.cmd("colorscheme kanso-zen")
