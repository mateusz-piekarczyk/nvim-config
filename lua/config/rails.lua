-- helper functions
_G.last_test_term = {
  win = nil,
  buf = nil
}

local function isRuby()
  if vim.bo.filetype ~= "ruby" then
    print("Not a Ruby file")
    return false
  end
  return true
end

local function runTest(cmd)
  local root = vim.fs.root(0, "Gemfile")
  if not root or vim.fn.executable(root .. "/bin/rails") ~= 1 then
    print("No bin/rails found above this file")
    return
  end
  cmd[1] = root .. "/" .. cmd[1]

  -- deleting the buffer also closes its window and stops the previous run
  if _G.last_test_term.buf and vim.api.nvim_buf_is_valid(_G.last_test_term.buf) then
    vim.api.nvim_buf_delete(_G.last_test_term.buf, { force = true })
  end

  vim.cmd("belowright split | resize 10")
  local term_buf = vim.api.nvim_create_buf(false, true)
  local term_win = vim.api.nvim_get_current_win()

  vim.api.nvim_win_set_buf(term_win, term_buf)
  vim.fn.jobstart(cmd, { term = true, cwd = root })

  _G.last_test_term.win = term_win
  _G.last_test_term.buf = term_buf

  vim.cmd("wincmd p") -- go back to previous window (keep focus where it was)
end


vim.keymap.set("n", "<leader>t", function()
  if (not isRuby()) then return end
  local file = vim.fn.expand("%:p")
  local line = vim.fn.line(".")
  local cmd = { "bin/rails", "test", file .. ":" .. line }

  runTest(cmd)
  -- open terminal split at the bottom, but don't move focus
end, { desc = "Run Rails test on current line", noremap = true, silent = true })

vim.keymap.set("n", "<leader>T", function()
  if (not isRuby()) then return end


  local file = vim.fn.expand("%:p")
  local line = vim.fn.line(".")
  local cmd = { "bin/rails", "test", file }
  runTest(cmd)
end, { desc = "Run Rails all tests of current file", noremap = true, silent = true })
