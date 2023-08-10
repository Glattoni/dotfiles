vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local bufopts = { buffer = event.buf }
    local map = vim.keymap.set
    map('n', 'gD', vim.lsp.buf.declaration, bufopts)
    map('n', 'gd', vim.lsp.buf.definition, bufopts)
    map('n', 'K', vim.lsp.buf.hover, bufopts)
    map('n', 'gi', vim.lsp.buf.implementation, bufopts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    map('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    map('n', 'gr', vim.lsp.buf.references, bufopts)
    map('n', '<space>f', function()
      vim.lsp.buf.format()
    end, bufopts)
  end,
})

-- close nvim tree if it is the last buffer
vim.api.nvim_create_autocmd('QuitPre', {
  callback = function()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match('NvimTree_') ~= nil then
        table.insert(tree_wins, w)
      end
      if vim.api.nvim_win_get_config(w).relative ~= '' then
        table.insert(floating_wins, w)
      end
    end
    if 1 == #wins - #floating_wins - #tree_wins then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})

-- Linting
vim.api.nvim_create_autocmd({ 'BufWritePost', 'LspAttach' }, {
  callback = function()
    require('lint').try_lint()
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd('BufWritePost', {
  callback = function()
    vim.cmd([[:FormatWrite]])
  end,
})
