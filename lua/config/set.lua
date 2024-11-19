--[[ vim.opt.clipboard = "unnamedplus";
vim.g.clipboard = {
    name = 'clip',
    copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe',
    },
    paste = {
        ['+'] = '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c Get-Clipboard',
        ['*'] = '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c Get-Clipboard',
    },
    cache_enabled = 0,
} ]]
vim.opt.nu = true;
vim.opt.relativenumber = true;



vim.opt.tabstop = 2;
vim.opt.shiftwidth = 2;
vim.opt.softtabstop = 2;
vim.opt.expandtab = true;

vim.opt.smartindent = true;

vim.opt.wrap = false;

vim.opt.hlsearch = false;
vim.opt.incsearch = true;

vim.opt.termguicolors = true;

vim.opt.scrolloff = 8;
vim.opt.signcolumn = "yes";

vim.opt.updatetime = 50;
-- vim.opt.colorcolumn = "80"



vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})
