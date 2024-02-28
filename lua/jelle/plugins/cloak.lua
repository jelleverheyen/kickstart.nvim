-- Allows you to overlay *'s (or any other character) over defined patterns in defined files.
-- https://github.com/laytan/cloak.nvim
return {
  'laytan/cloak.nvim',
  config = function ()
    require('cloak').setup({
      enabled = false,
      cloak_character = '*',
      highlight_group = 'Comment',
      patterns = {
        {
          file_pattern = {
            '.env*',
            '.*.env',
          }
        }
      },
      cloak_pattern = '=.+',
    })
  end,
}
