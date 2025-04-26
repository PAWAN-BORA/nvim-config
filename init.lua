require("options")
require("config.lazy")
require("keymap")

vim.api.nvim_create_autocmd("TextYanKPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", {clear = true}),
  callback = function()
    vim.hl.on_yank()
  end,
})
