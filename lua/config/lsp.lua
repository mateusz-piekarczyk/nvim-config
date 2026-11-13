vim.lsp.config('ruby_lsp', {
  init_options = {
    formatter = 'rubocop',
    linters = { 'rubocop' },
  },
})

vim.lsp.enable('ruby_lsp')
