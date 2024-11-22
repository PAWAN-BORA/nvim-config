function SetTheam(theam)
  theam = theam or "tokyonight";
  -- theam = theam or "rose-pine-main";
  vim.cmd.colorscheme(theam);

end

-- install theme list-> rose-pine, ondark, tokyonight 
-- require('onedark').setup({
--   style='darker'
-- })
--
SetTheam();
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")
