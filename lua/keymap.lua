local keymap = vim.keymap;
keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")


keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("x", "<leader>p", "\"_dP")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("v", "<leader>s", [[:s/\<<C-r>"\>/<C-r>"/gI<Left><Left><Left>]])
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- keymap.set("n", "-", ":lua MiniFiles.open()<CR>")

-- LPS key mappings
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    local lsp = vim.lsp;
    keymap.set('n', 'K', lsp.buf.hover, opts)
    keymap.set('n', 'gd', lsp.buf.definition, opts)
    keymap.set('n', 'gD', lsp.buf.declaration, opts)
    keymap.set('n', 'gi', lsp.buf.implementation, opts)
    keymap.set('n', 'go', lsp.buf.type_definition, opts)
    -- keymap.set('n', 'gr', lsp.buf.references, opts)
    keymap.set('n', 'gs', lsp.buf.signature_help, opts)
    keymap.set('n', '<F2>', lsp.buf.rename, opts)
    keymap.set('n', '<leader>i', vim.diagnostic.open_float, opts)
    -- keymap.set({ 'n', 'x' }, '<F3>', lsp.buf.format({ async = true }), opts)
    keymap.set('n', '<F4>', lsp.buf.code_action, opts)
  end
});

-- Telescope key mappings
local builtin = require('telescope.builtin');
keymap.set('n', '<leader>fs', builtin.find_files, {})
keymap.set('n', '<leader>bs', builtin.buffers, {})
keymap.set('n', '<leader>gs', builtin.live_grep, {})
keymap.set('n', '<C-p>', builtin.git_files, {})
keymap.set('n', 'gr', builtin.lsp_references, {})
keymap.set('n', '<leader>ps', function()
  builtin.grep_string({search = vim.fn.input("Grep > ")});
end)

-- Gitsigns key mappings
local gitsigns = require('gitsigns');
keymap.set('n', '<leader>gb', gitsigns.blame_line, {})
keymap.set('n', '<leader>gfb', gitsigns.blame, {})
keymap.set('n', '<leader>gp', gitsigns.preview_hunk)
keymap.set('n', '<leader>gtb', gitsigns.toggle_current_line_blame)
keymap.set('n', '<leader>gd', function()
  gitsigns.diffthis('~')
end)


-- terminal keymap
keymap.set('n', '<C-t>', "<CMD>ToggleTerm<CR>", {})
keymap.set('t', '<Esc><Esc>', "<C-\\><C-N>", {})
keymap.set('t', '<C-t>', "<CMD>ToggleTerm<CR>", {})
