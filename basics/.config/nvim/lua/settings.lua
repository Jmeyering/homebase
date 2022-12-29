vim.o.ignorecare = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.wildignore = '/cache/*,*/node_modules/*,*/vendor/*'
vim.o.background = 'dark'
vim.o.list = true
vim.o.listchars = 'tab:»·,trail:·'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.nofoldenable = true
vim.o.diffopt = 'vertical'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.autowrite = true
vim.o.hidden = true
vim.o.completeopt='longest,menuone'
vim.o.number = true
vim.o.relativenumber = true
vim.o.textwidth = 80
vim.o.mouse = false

-- auto-complete helper
vim.cmd('inoremap <expr> <CR> pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"')
