vim.g.go_fmt_command = "goimports"

local golang_grp = vim.api.nvim_create_augroup("golang_only", {clear = true})

-- golang tab formatting
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'go',
    group = golang_grp,

    callback = function ()
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.softtabstop = 4
      vim.opt_local.expandtab = false

      -- do not display tab icons in go
      vim.opt_local.listchars = 'tab:  '
    end
  })

vim.cmd([[
  autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)
]])


vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    group = golang_grp,
    callback = function()
      require('go.format').goimport()
    end,
  })


vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave"}, {
    callback = function ()
      vim.opt_local.relativenumber = true
    end
  })

vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter"}, {
    callback = function ()
      vim.opt_local.relativenumber = false
    end
  })

require('go').setup({
    max_line_len = 80,
  })
