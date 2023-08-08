return {
  "akinsho/bufferline.nvim",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup {
      options = {
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 20,
        diagnostics = false,
        offsets = { { filetype = 'NvimTree', text = 'File Explorer', highlight = 'Directory', text_align = 'left' } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = 'thin',
        enforce_regular_tabs = true,
        always_show_bufferline = false,
        sort_by = 'id',
      },
      highlights = require('catppuccin.groups.integrations.bufferline').get(),
    }
  end
}
