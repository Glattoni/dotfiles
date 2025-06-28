local add = MiniDeps.add

add({
  source = "nvim-treesitter/nvim-treesitter",
  checkout = "master",
  monitor = "main",
  hooks = {
    post_checkout = function()
      vim.cmd("TSUpdate")
    end,
  },
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "rust",
    "lua",
    "c",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "typescript",
    "javascript",
  },
  auto_install = false,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
})
