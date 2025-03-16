-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
require('lazy').setup({
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'
    -- Auto complete
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Setting Pyright (Python LSP)
    lspconfig.pyright.setup {
      capabilities = capabilities,
    }
    -- Setting Lua LSP
    lspconfig.lua_ls.setup {
      settings = {
        lua = {
          diagnostics = { globals = { 'vim' } },
        },
      },
    }
  end,
}, {
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = { 'pyright', 'lua_ls' },
    }
  end,
})
