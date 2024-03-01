return {
  'mbbill/undotree',
  config = function ()
    vim.keymap.set('n', '<C-h>', vim.cmd.UndotreeToggle)
  end,
}
