return {
  'mhartington/formatter.nvim',
  config = function()
    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    require('formatter').setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      -- All formatter configurations are opt-in
      filetype = {
        lua = {
          require('formatter.filetypes.lua').stylua,
        },
        html = {
          require('formatter.filetypes.html').prettierd,
        },
        css = {
          require('formatter.filetypes.css').prettierd,
        },
        javascript = {
          require('formatter.filetypes.javascript').prettierd,
        },
        javascriptreact = {
          require('formatter.filetypes.javascriptreact').prettierd,
        },
        typescript = {
          require('formatter.filetypes.typescript').prettierd,
        },
        typescriptreact = {
          require('formatter.filetypes.typescriptreact').prettierd,
        },
        rust = {
          require('formatter.filetypes.rust').rustfmt,
        },
        json = {
          require('formatter.filetypes.json').prettierd,
        },
        ['*'] = {
          -- "formatter.filetypes.any" defines default configurations for any filetype
          require('formatter.filetypes.any').remove_trailing_whitespace,
        },
      },
    })
  end,
}
