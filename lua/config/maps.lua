vim.keymap.set('n', '<leader>f', require('fzf-lua').files, { desc = 'FzfLua: Find files' })
vim.keymap.set('n', '<leader>g', require('fzf-lua').live_grep, { desc = 'FzfLua: Live grep' })
vim.keymap.set('n', '<leader>b', require('fzf-lua').buffers, { desc = 'FzfLua: Buffers' })

-- buffer-local so gd/gD fall back to the built-ins where no LSP is attached
-- (implementation is the built-in gri, which keeps gi as "insert at last insert")
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
    end
    map("gd", vim.lsp.buf.definition, "Go to Definition")
    map("gD", vim.lsp.buf.declaration, "Go to Declaration")
    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
  end,
})

-- [d / ]d are built-in; open the float after jumping like goto_prev/goto_next used to
vim.diagnostic.config({
  jump = {
    on_jump = function(diagnostic)
      if diagnostic then vim.diagnostic.open_float() end
    end,
  },
})
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open Float"})
vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Explorer (Oil)" })

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
