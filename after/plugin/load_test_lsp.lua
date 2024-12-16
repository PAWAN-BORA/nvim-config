
local lsp_attach = function(client, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set('n', '<leader>i', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end
-- local client = vim.lsp.start_client {
--   name = "markdown_lsp",
--   cmd = {"deno", "run", "--allow-read", "--allow-write", "/home/pawan/projects/deno/markdown_lsp/main.ts"},
--   on_attach = lsp_attach
-- }
--
-- if not client then
--   print("client is not working...")
--   vim.notify "client is not working."
--   return
-- end
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function ()
--     vim.lsp.buf_attach_client(0, client)
--   end,
-- })
