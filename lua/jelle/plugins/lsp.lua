local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },
}

local function on_attach(_, bufnr)
  local telescope = require('telescope.builtin')
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, {buffer = bufnr, desc = desc})
  end

  nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>ca', function()
    vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
  end, 'Code Action')

  nmap('gd', telescope.lsp_definitions, 'Goto Definition')
  nmap('gr', telescope.lsp_references, 'Goto References')
  nmap('gI', telescope.lsp_implementations, 'Goto Implementations')
  nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')

  nmap('K', vim.lsp.buf.hover, 'Documentation')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'willamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'j-hui/fidget.nvim',
  },
  config = function ()
    require('neodev').setup()

    require('fidget').setup({})
    require('mason').setup()
    local cmp = require('cmp')
    local cmp_lsp = require('cmp_nvim_lsp')
    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    local capabilities = vim.tbl_deep_extend(
      'force',
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    mason_lspconfig.setup_handlers({
      function (server_name)
        require('lspconfig')[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes
        })
      end
    })
  end
}

