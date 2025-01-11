-- Nocturnal Winter color scheme for Neovim
-- Save this file as ~/.config/nvim/colors/nocturnal-winter.lua


local colors = {
  background = "#0d0d17", -- Background Color
  foreground = "#e5e5e5", -- Foreground Color
  cursor = "#e5e5e5",     -- Cursor Color
  selection = "#adbdc1",  -- Selection Color
  ansi_0 = "#4c4c4c",     -- Black
  ansi_1 = "#f1182b",     -- Red
  ansi_2 = "#08cd13",     -- Green
  ansi_3 = "#f5f11a",     -- Yellow
  ansi_4 = "#3078e6",     -- Blue
  ansi_5 = "#ff2b6d",     -- Magenta
  ansi_6 = "#09c87c",     -- Cyan
  ansi_7 = "#fafafa",     -- White
  ansi_8 = "#7f7f7f",     -- Bright Black (Gray)
  ansi_9 = "#f1182b",     -- Bright Red
  ansi_10 = "#08cd13",    -- Bright Green
  ansi_11 = "#f5f11a",    -- Bright Yellow
  ansi_12 = "#3078e6",    -- Bright Blue
  ansi_13 = "#ff2b6d",    -- Bright Magenta
  ansi_14 = "#09c87c",    -- Bright Cyan
  ansi_15 = "#ffffff"     -- Bright White
}


vim.cmd("highlight clear")
vim.opt.background = "dark"
vim.g.colors_name = "nocturnal-winter"


local function highlight(group, fg, bg, attr)
  local command = "highlight " .. group .. " "
  if fg then command = command .. "guifg=" .. fg .. " " end
  if bg then command = command .. "guibg=" .. bg .. " " end
  if attr then command = command .. "gui=" .. attr end
  vim.cmd(command)
end


-- Basic Highlights
highlight("Normal", colors.foreground, colors.background)
highlight("CursorLine", nil, colors.selection)
highlight("Visual", nil, colors.selection)
highlight("CursorLineNr", colors.foreground, nil, "bold")
highlight("LineNr", colors.ansi_8)
highlight("Comment", colors.ansi_8, nil, "italic")
highlight("String", colors.ansi_2)
highlight("Function", colors.ansi_4)
highlight("Keyword", colors.ansi_5)
highlight("Type", colors.ansi_6)
highlight("Constant", colors.ansi_3)


-- Fix for SignColumn (explicitly match background color)
highlight("SignColumn", nil, colors.background)


-- Additional Highlights (adjust as needed)
highlight("ErrorMsg", colors.ansi_1, nil, "bold")
highlight("WarningMsg", colors.ansi_3, nil, "bold")
highlight("Search", colors.background, colors.ansi_3)
highlight("IncSearch", colors.background, colors.ansi_4)


-- Terminal Colors (for :terminal in Neovim)
vim.g.terminal_color_0 = colors.ansi_0
vim.g.terminal_color_1 = colors.ansi_1
vim.g.terminal_color_2 = colors.ansi_2
vim.g.terminal_color_3 = colors.ansi_3
vim.g.terminal_color_4 = colors.ansi_4
vim.g.terminal_color_5 = colors.ansi_5
vim.g.terminal_color_6 = colors.ansi_6
vim.g.terminal_color_7 = colors.ansi_7
vim.g.terminal_color_8 = colors.ansi_8
vim.g.terminal_color_9 = colors.ansi_9
vim.g.terminal_color_10 = colors.ansi_10
vim.g.terminal_color_11 = colors.ansi_11
vim.g.terminal_color_12 = colors.ansi_12
vim.g.terminal_color_13 = colors.ansi_13
vim.g.terminal_color_14 = colors.ansi_14
vim.g.terminal_color_15 = colors.ansi_15
