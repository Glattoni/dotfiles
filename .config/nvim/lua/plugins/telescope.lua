return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        path_display = { 'smart' },
        layout_strategy = 'vertical',
        layout_config = {
          vertical = { width = 0.5 },
        },
        file_ignore_patterns = {
          'node_modules',
          'package.json',
          'package-lock.json',
        },
      },
      pickers = {
        find_files = {
          theme = 'dropdown',
          previewer = false,
        },
        live_grep = {
          theme = 'dropdown',
          previewer = false,
        },
        current_buffer_fuzzy_find = {
          theme = 'dropdown',
          previewer = false,
        },
        buffers = {
          theme = 'dropdown',
          previewer = false,
          mappings = {
            i = {
              ['<c-d>'] = 'delete_buffer',
            },
          },
        },
        git_branches = {
          theme = 'dropdown',
          previewer = false,
        },
      },
    })
  end,
}
