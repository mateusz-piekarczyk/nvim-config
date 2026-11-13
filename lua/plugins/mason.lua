return {
  -- Mason for LSP management
  {
    'mason-org/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },

  -- Mason LSP installer (install LSP servers)
  {
    'mason-org/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls' },  -- Automatically install Lua LSP
      })
    end
  },

  -- nvim-lspconfig for LSP configuration
  {
    'neovim/nvim-lspconfig',
  },
}
