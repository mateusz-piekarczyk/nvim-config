return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").install({
        "ruby", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
        "bash", "json", "yaml", "html", "javascript", "css", "sql", "embedded_template",
      })

      -- main branch doesn't enable highlighting by itself
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")

      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
        },
        move = {
          set_jumps = true,
        },
      })

      -- Select keymaps
      local select_maps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["a/"] = "@comment.outer",
        ["i/"] = "@comment.outer",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      }

      for key, query in pairs(select_maps) do
        vim.keymap.set({ "x", "o" }, key, function()
          select.select_textobject(query, "textobjects")
        end, { desc = "Select " .. query })
      end

      -- Move keymaps
      local move_maps = {
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["gj"] = "@function.outer",
          ["]]"] = "@class.outer",
          ["]b"] = "@block.outer",
          ["]a"] = "@parameter.inner",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["gJ"] = "@function.outer",
          ["]["] = "@class.outer",
          ["]B"] = "@block.outer",
          ["]A"] = "@parameter.inner",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["gk"] = "@function.outer",
          ["[["] = "@class.outer",
          ["[b"] = "@block.outer",
          ["[a"] = "@parameter.inner",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["gK"] = "@function.outer",
          ["[]"] = "@class.outer",
          ["[B"] = "@block.outer",
          ["[A"] = "@parameter.inner",
        },
      }

      for method, maps in pairs(move_maps) do
        for key, query in pairs(maps) do
          vim.keymap.set({ "n", "x", "o" }, key, function()
            move[method](query, "textobjects")
          end, { desc = method .. " " .. query })
        end
      end
    end,
  },
}
