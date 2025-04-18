
local lint = require('lint')

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  python = { "pylint" },
  lua = { "luacheck" },
  go = { "golangcilint" },
  sh = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})

print("Hello from lint..")
print("Hello from lint..")
print("Hello from lint..")
