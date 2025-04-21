
local lint = require('lint')

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  -- python = { "pylint" },
  -- lua = { "luacheck" },
  -- go = { "golangcilint" },
  -- sh = { "shellcheck" },
}


local function isEslintSetup()
  return vim.fn.filereadable('.eslintrc.js') ==1 or vim.fn.filereadable('.eslintrc.json') == 1 or vim.fn.filereadable('eslint.config.js') == 1
end
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    if isEslintSetup() then
      lint.try_lint()
    end
  end,
})
