require("lualine").setup({
  sections = {
     lualine_c = {
      {
        'filename',
        path = 1, -- Show absolute path
      }
    },
  }
});

