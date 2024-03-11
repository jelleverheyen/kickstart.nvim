return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Add fuzzy finder, requires make to be installed
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function ()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    telescope.setup({})

    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]iles'})
    vim.keymap.set('n', '<C-p>', builtin.git_files, { })
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = '[P]roject [S]earch'})
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = '[V]iew [H]elp'})
  end
}
