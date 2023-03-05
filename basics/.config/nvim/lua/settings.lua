vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.hlsearch = true
vim.opt.wildignore = { '/cache/*', '*/node_modules/*', '*/vendor/*' }
vim.opt.background = 'dark'
vim.opt.list = true
vim.opt.listchars = 'tab:»·,trail:·'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.diffopt = 'vertical'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.autowrite = true
vim.opt.hidden = true
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.textwidth = 80
vim.opt.mouse = ""

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
