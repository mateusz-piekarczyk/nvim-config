return {
  -- Mason for LSP management
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },

  -- Mason LSP installer (install LSP servers)
  {
    'williamboman/mason-lspconfig.nvim',
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
