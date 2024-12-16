vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


vim.keymap.set("x", "<leader>p", "\"_dP")


vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

local buf_id = nil;
local win_id = nil;
vim.keymap.set("n", "<leader>t", function ()
  if win_id==nil or not vim.api.nvim_win_is_valid(win_id) then
    local buf_exit = true;
    if(buf_id==nil or not vim.api.nvim_buf_is_valid(buf_id)) then
      buf_id =  vim.api.nvim_create_buf(false, true);
      buf_exit = false;
    end
     win_id = vim.api.nvim_open_win(buf_id, true, {
      split = "below",
      win = 0,
      height = 8,
    })
    if(not buf_exit) then
      vim.cmd.term();
    end
  else
    vim.api.nvim_win_close(win_id, true);
    win_id = nil;
  end
end)
