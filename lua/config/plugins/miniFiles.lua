return {
  {
    'echasnovski/mini.files',
    enabled = false,
    version = '*',
    config = function ()
      require('mini.files').setup()
    end
  }
}
