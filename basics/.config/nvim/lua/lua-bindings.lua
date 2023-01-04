local lua_grp = vim.api.nvim_create_augroup("lua_only", { clear = true })
-- golang tab formatting
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  group = lua_grp,
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})
