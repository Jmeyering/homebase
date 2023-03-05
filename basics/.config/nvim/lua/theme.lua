local colorColumnOffset = 80

-- calculate the columns to be colored
local cc = {}
for i = 1, 2000 do
  cc[i] = i + colorColumnOffset
end

vim.opt.colorcolumn = cc
--vim.opt.termguicolors = true

-- vim.o.bg = "dark"
vim.g.solarized_italics = 0
vim.g.solarized_termtrans = 1

vim.cmd('colorscheme solarized')

vim.g.gitgutter_override_sign_column_highlight = 0
