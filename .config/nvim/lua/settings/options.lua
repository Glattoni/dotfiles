local options = {
  number = true,
  relativenumber = false,
  expandtab = true,
  shiftwidth = 2,
  softtabstop = 2,
  smartindent = true,
  wrap = false,
  scrolloff = 6,
  sidescrolloff = 6,
  hidden = true,
  incsearch = true,
  hls = false,
  swapfile = false,
  backup = false,
  termguicolors = true,
  ignorecase = true,
  showtabline = 0,
  undofile = true,
  updatetime = 500,
  mouse = 'a',
  pumheight = 10,
  splitbelow = true,
  splitright = true,
  signcolumn = 'yes:1',
  showmode = false,
  cursorline = true,
  cursorlineopt = 'both',
  smartcase = true,
  clipboard = 'unnamedplus',
  background = 'dark',
  laststatus = 3,
  completeopt = { 'menu', 'menuone', 'noselect', 'noinsert' },
  guifont = 'Hack Nerd Font:h12',
  cmdheight = 1,
  mousemoveevent = true,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
