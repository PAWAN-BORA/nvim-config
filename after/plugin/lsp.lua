local lsp_zero = require('lsp-zero')
require("mason").setup()
require("mason-lspconfig").setup()


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

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
});

local nvim_lsp = require("lspconfig");
nvim_lsp.lua_ls.setup({});
nvim_lsp.svelte.setup({});
nvim_lsp.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false,
      },
      procMacro = {
        ignored = {
          leptos_macro = {
            -- optional: --
            -- "component",
            "server",
          },
        },
      },
    }
  },
  -- on_attach = function (client, bufnr)
  --   client.server_capabilities.documentFormattingProvider = false
  -- end

}
local function isDenoProject()
  return vim.fn.filereadable('deno.json') ==1 or vim.fn.filereadable('deno.jsonc') == 1
end

if(isDenoProject()) then
  nvim_lsp.denols.setup({ });
else
  nvim_lsp.ts_ls.setup({
    filetypes = {
      "javascript",
      "typescript",
      "typescriptreact",
    },
  });
end

local configs = require 'lspconfig.configs'
if not configs.markdown_lsp then
  configs.markdown_lsp = {
    default_config = {
      cmd = {"deno", "run", "--allow-read", "--allow-write", "/home/pawan/projects/deno/markdown_lsp/main.ts"},
      filetypes = {'markdown'},
      single_file_support=true,
      settings = {},
    },
  }
end
nvim_lsp.markdown_lsp.setup({ })


if not configs.html_lsp then
  configs.html_lsp = {
    default_config = {
      -- cmd = { "sh", "-c", "RUSTFLAGS='-A warnings' cargo run --manifest-path /home/pawan/projects/rust/html_lsp/Cargo.toml" },
      cmd = {"/home/pawan/projects/rust/html_lsp/target/release/html_lsp"},
      filetypes = {'html'},
      single_file_support=true,
      settings = {},
    },
  }
end
nvim_lsp.html_lsp.setup({ })

nvim_lsp.css_variables.setup({});
nvim_lsp.tailwindcss.setup({
  root_dir = nvim_lsp.util.root_pattern("tailwind.config.js", "tailwind.config.ts")
});
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
})
require('nvim-autopairs').setup({});
