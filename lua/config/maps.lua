vim.keymap.set('n', '<leader>f', require('fzf-lua').files, { desc = 'FzfLua: Find files' })
vim.keymap.set('n', '<leader>g', require('fzf-lua').live_grep, { desc = 'FzfLua: Live grep' })
vim.keymap.set('n', '<leader>b', require('fzf-lua').buffers, { desc = 'FzfLua: Buffers' })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition"})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration"})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation"})
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find References"})
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation"})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol"})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action"})
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic"})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic"})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "open float"})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
