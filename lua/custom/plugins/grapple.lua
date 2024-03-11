return {
  'cbochs/grapple.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = true }
  },
  config = function ()
    local grapple = require('grapple')

    vim.keymap.set('n', '<leader>m', grapple.toggle)
    vim.keymap.set('n', '<leader>M', grapple.toggle_tags)

    vim.keymap.set('n', '<leader>1', '<cmd>Grapple select index=1<cr>')
    vim.keymap.set('n', '<leader>1', '<cmd>Grapple select index=2<cr>')
    vim.keymap.set('n', '<leader>1', '<cmd>Grapple select index=3<cr>')
    vim.keymap.set('n', '<leader>1', '<cmd>Grapple select index=4<cr>')
    vim.keymap.set('n', '<leader>1', '<cmd>Grapple select index=5<cr>')

  end

}
