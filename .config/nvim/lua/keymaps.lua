-- stylua: ignore start

-- Netrw
-- vim.keymap.set('n', '<Leader>e', ':Lexplore<CR>')

-- Easier navigation between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Run lua code
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Pickers
vim.keymap.set("n", "<leader>ff", function() MiniPick.builtin.files() end)
vim.keymap.set("n", "<leader>gl", function() MiniPick.builtin.grep_live() end)
vim.keymap.set("n", "<leader>fb", function() MiniPick.builtin.buffers() end)
vim.keymap.set("n", "<leader>fl", function() MiniPick.builtin.resume() end)

-- Zen mode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>")

-- Formatting
vim.keymap.set("n", "<leader>f", function() require("conform").format({ async = true }) end)

-- Browse directories
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Toggle diagnostic
vim.keymap.set("n", "<leader>td", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end)

-- Harpoon
vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end)
vim.keymap.set("n", "<leader>h", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end)

vim.keymap.set("n", "<leader>1", function() require("harpoon"):list():select(1) end)
vim.keymap.set("n", "<leader>2", function() require("harpoon"):list():select(2) end)
vim.keymap.set("n", "<leader>3", function() require("harpoon"):list():select(3) end)
vim.keymap.set("n", "<leader>4", function() require("harpoon"):list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<c-p>", function() require("harpoon"):list():prev() end)
vim.keymap.set("n", "<c-n>", function() require("harpoon"):list():next() end)
