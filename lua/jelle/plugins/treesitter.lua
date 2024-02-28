return {
  'nvim-treesitter/',
  build = ':TSBuild',
  config = function()
    require('nvim-treesitter.configs').setup({
      auto_install = true,
      ensure_installed = { 'vimdoc', 'lua', 'rust', 'bash', 'javascript', 'csharp', 'go' },
      sync_install = false,
      indent = {
        enable = true
      },
      ignore_install = { },
      modules = { },
      -- TODO: Enable
      incremental_selection = {
        enable = false,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },
    })
  end
}
