return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
    'mxsdev/nvim-dap-vscode-js',
    {
      'microsoft/vscode-js-debug',
      version = '1.x',
      build = 'npm i && npm run compile vsDebugServerBundle && mv dist out',
    },
  },
  config = function()
    -- require('dap-vscode-js').setup({
    --   debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter',
    --   debugger_cmd = { 'js-debug-adapter' },
    --   adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    -- })
    require('dap-vscode-js').setup({
      debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    })

    for _, language in ipairs({ 'typescript', 'javascript' }) do
      require('dap').configurations[language] = {
        -- attach to a node process that has been started with
        -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
        -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
        {
          -- use nvim-dap-vscode-js's pwa-node debug adapter
          type = 'pwa-node',
          -- attach to an already running node process with --inspect flag
          -- default port: 9222
          request = 'attach',
          -- allows us to pick the process using a picker
          processId = require('dap.utils').pick_process,
          -- name of the debug action you have to select for this config
          name = 'Attach debugger to existing `node --inspect` process',
          -- for compiled languages like TypeScript or Svelte.js
          sourceMaps = true,
          -- resolve source maps in nested locations while ignoring node_modules
          resolveSourceMapLocations = {
            '${workspaceFolder}/**',
            '!**/node_modules/**',
          },
          -- path to src in vite based projects (and most other projects as well)
          cwd = '${workspaceFolder}/src',
          -- we don't want to debug code inside node_modules, so skip it!
          skipFiles = { '${workspaceFolder}/node_modules/**/*.js' },
        },
        {
          type = 'pwa-chrome',
          name = 'Launch Chrome to debug client',
          request = 'launch',
          url = 'http://localhost:5173',
          sourceMaps = true,
          protocol = 'inspector',
          port = 9222,
          webRoot = '${workspaceFolder}/src',
          -- skip files from vite's hmr
          skipFiles = { '**/node_modules/**/*', '**/@vite/*', '**/src/client/*', '**/src/*' },
        },
        -- only if language is javascript, offer this debug action
        language == 'javascript'
            and {
              -- use nvim-dap-vscode-js's pwa-node debug adapter
              type = 'pwa-node',
              -- launch a new process to attach the debugger to
              request = 'launch',
              -- name of the debug action you have to select for this config
              name = 'Launch file in new node process',
              -- launch current file
              program = '${file}',
              cwd = '${workspaceFolder}',
            }
          or nil,
      }
    end

    require('nvim-dap-virtual-text').setup()
    require('dapui').setup()

    local dap, dapui = require('dap'), require('dapui')
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
  keys = {
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
    },
    {
      '<leader>c',
      function()
        require('dap').continue()
      end,
    },
    {
      '<leader>lj',
      function()
        if vim.fn.filereadable then
          require('dap.ext.vscode').load_launchjs()
          print('Loading launch json')
        end
        require('dap').continue()
      end,
    },
  },
}
