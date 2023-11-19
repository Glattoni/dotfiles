local map = require('utils').map

local define_lsp_sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = '',
  })
end

local sings = {
  { name = 'DiagnosticSignError', text = '' },
  { name = 'DiagnosticSignWarn', text = '' },
  { name = 'DiagnosticSignHint', text = '' },
  { name = 'DiagnosticSignInfo', text = '' },
}

local diagnostics_config = {
  virtual_text = false,
  signs = true,
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
  for _, v in pairs(sings) do
    define_lsp_sign({ name = v.name, text = v.text })
  end

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
  'tsserver',
  'emmet_ls',
  'angularls',
  'cssls',
  'lua_ls',
  'taplo',
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
