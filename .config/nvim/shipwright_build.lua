-- Get the colors for the current theme
local colors = require("kanso.colors").setup({ theme = "zen" })
local palette_colors = colors.palette
-- local theme_colors = colors.theme

-- print(vim.inspect(theme_colors))
print(vim.inspect(palette_colors))

-- Get the colors for a specific theme
-- local zen_colors = require("kanso.colors").setup({ theme = "zen" })
-- print(vim.inspect(colorscheme))

local function transform(palette)
  return {
    fg = palette.inkWhite,
    bg = palette.zen0,
    cursor_fg = palette.zen0,
    cursor_bg = palette.fujiWhite,

    black = palette.zen0,
    red = palette.inkRed,
    green = palette.inkGreen2,
    yellow = palette.inkYellow,
    blue = palette.inkBlue2,
    magenta = palette.inkPink,
    cyan = palette.inkWhite,
    white = palette.inkGray,
    bright_black = palette.inkGray1,
    bright_red = palette.zenRed,
    bright_green = palette.inkGreen,
    bright_yellow = palette.carpYellow,
    bright_blue = palette.springBlue,
    bright_magenta = palette.springViolet1,
    bright_cyan = palette.zenAqua2,
    bright_white = palette.inkWhite,
  }
end

run(palette_colors, transform, contrib.foot, { overwrite, "/home/alex/.config/foot/fooot.ini" })
