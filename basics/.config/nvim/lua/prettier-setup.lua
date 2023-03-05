local prettier = require("prettier")

prettier.setup({
  bin = 'prettier',
  ["null-ls"] = {
    condition = function()
      return prettier.config_exists({
        -- if `false`, skips checking `package.json` for `"prettier"` key
        check_package_json = true,
      })
    end,
    runtime_condition = function()
      return true
    end,
    timeout = 5000,
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "json",
    "typescript",
    "typescriptreact",
  },
})
