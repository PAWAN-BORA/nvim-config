return {
  'stevearc/oil.nvim',
  -- enabled = false,
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  config= function ()
    require("oil").setup({
      view_options = {
        show_hidden = true
      },
      keymaps ={
        ["<C-t>"] = false,
      }
    });
  end
}
