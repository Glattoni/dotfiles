local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Save file
keymap.set('n', '<C-s>', ':w<CR>', opts)
keymap.set('i', '<C-s>', '<esc>:w<CR>', opts)

-- Bufferline
keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', opts) keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
keymap.set('n', '<Leader>x', ':BufferLinePickClose<CR>', opts)
keymap.set('n', '<Leader>pb', ':BufferLineTogglePin<CR>', opts)
keymap.set('n', '<Leader>bmn', ':BufferLineMoveNext<CR>', opts)
keymap.set('n', '<Leader>bmp', ':BufferLineMovePrev<CR>', opts)

-- File explorer
keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)

-- Telescope
keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
keymap.set('n', '<Leader>lg', ':Telescope live_grep<CR>', opts)
keymap.set('n', '<Leader>gs', ':Telescope grep_string<CR>', opts)

keymap.set('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
keymap.set('n', '<Leader>gb', ':Telescope git_branches<CR>', opts)
keymap.set('n', '<Leader>fg', ':Telescope current_buffer_fuzzy_find<CR>', opts)
keymap.set('n', '<Leader>ht', ':Telescope help_tags<CR>', opts)
keymap.set('n', 'gr', ':Telescope lsp_references<CR>', opts)

-- Git signs
keymap.set('n', '<Leader>bl', ':Gitsigns blame_line<CR>', opts)
keymap.set('n', '<Leader>ph', ':Gitsigns preview_hunk<CR>', opts)

-- Easier navigation between windows
keymap.set('n', '<C-h>', '<C-w>h', opts)
keymap.set('n', '<C-j>', '<C-w>j', opts)
keymap.set('n', '<C-k>', '<C-w>k', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)
