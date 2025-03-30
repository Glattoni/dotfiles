local map = require('utils').map

local diagnostics_config = {
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
}

local function on_attach(_, buffer)
  vim.diagnostic.config(diagnostics_config)

  local handlers = vim.lsp.handlers
  local keymap_opts = { buffer = buffer, noremap = true, silent = true }

  handlers['textDocument/hover'] = vim.lsp.with(handlers.hover, { border = 'rounded' })
  handlers['textDocument/signatureHelp'] = vim.lsp.with(handlers.signature_help, { border = 'rounded' })

  map('n', 'gl', vim.diagnostic.open_float, keymap_opts)
  map('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
  map('n', ']d', vim.diagnostic.goto_next, keymap_opts)
  map('n', '<space>q', vim.diagnostic.setloclist, keymap_opts)
end

local servers = {
  'ts_ls',
  'emmet_ls',
  'angularls',
  'cssls',
  'lua_ls',
  'taplo',
  'marksman',
}

return {
  'williamboman/mason.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('mason').setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })

    require('mason-lspconfig').setup({
      ensure_installed = servers,
      automatic_installation = true,
    })

    for _, server in pairs(servers) do
      lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ['rust-analyzer'] = {
          checkOnSave = {
            command = 'clippy',
          },
        },
      },
    })
  end,
}
