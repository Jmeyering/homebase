local tf_grp = vim.api.nvim_create_augroup("tf_only", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars" },
  group = tf_grp,
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})
