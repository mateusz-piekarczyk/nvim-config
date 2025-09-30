vim.lsp.config('ruby_lsp', {
  init_options = {
    formatter = 'standard',
    linters = { 'standard' },
  },
})

vim.lsp.enable('ruby_lsp')
