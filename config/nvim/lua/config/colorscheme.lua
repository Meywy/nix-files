vim.g.matchparen_disable_cursor_hl = 1

vim.cmd.colorscheme("zaibatsu")

local function set_hl(group, val)
  vim.api.nvim_set_hl(0, group, val)
end

set_hl("Normal", { fg = "#ffffff", bg = "#080016" })
set_hl("EndOfBuffer", { fg = "#afafff", bg = "#080016" })
set_hl("NonText", { fg = "#878092", bg = "#080016" })
set_hl("StatusLine", { fg = "#080016", bg = "#ffafff" })
set_hl("StatusLineNC", { fg = "#ffafff", bg = "#0e0024" })
set_hl("ModeMsg", { fg = "#080016", bg = "#00afff" })
set_hl("TabLine", { fg = "#ffafff", bg = "#0e0024" })
set_hl("TabLineSel", { fg = "#080016", bg = "#ffafff" })
set_hl("TabLineFill", { fg = "#ffafff", bg = "#0e0024" })
set_hl("MatchParen", { fg = "#ff8796", bg = nil, reverse = true })