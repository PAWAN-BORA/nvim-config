function SetTheam(theam)
  theam = theam or "onedark";
  -- theam = theam or "rose-pine-main";
  vim.cmd.colorscheme(theam);

end

require('onedark').setup({
  style='darker'
})

SetTheam();
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")
