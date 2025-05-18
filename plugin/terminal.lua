local state = {
  floating = {
    buf = nil,
    win = nil,
  }
}
local function createTerminal(opts)
  opts = opts or {}
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = nil;
  if opts.buf~=nil and vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end
  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }
  local win = vim.api.nvim_open_win(buf, true, win_config);
  return {buf=buf, win = win}
end

local function toggleTerm()
  local win_id = state.floating.win;
  if win_id == nil or not vim.api.nvim_win_is_valid(win_id) then
    state.floating = createTerminal({buf=state.floating.buf})
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.term()
      vim.cmd.startinsert()
    end
  else
    vim.api.nvim_win_hide(win_id)
  end
end
vim.api.nvim_create_user_command("ToggleTerm", toggleTerm, {})

