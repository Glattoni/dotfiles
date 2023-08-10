return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        globalstatus = true,
        theme = 'auto',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_y = {
          { 'progress', separator = '', padding = { left = 0, right = 0 } },
          { 'location', padding = { left = 0, right = 0 } },
        },
        lualine_z = {
          function()
            return ' ' .. os.date('%R')
          end,
        },
      },
    })
  end,
}
