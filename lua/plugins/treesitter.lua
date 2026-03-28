return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
  },
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    textobjects = {
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
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
      },
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["a/"] = "@comment.outer",
          ["i/"] = "@comment.outer", -- no inner for comment
          ["aa"] = "@parameter.outer", -- parameter -> argument
          ["ia"] = "@parameter.inner",
        },
      },
      lsp_interop = {
        enable = true,
        border = "none",
        peek_definition_code = {
          ["<leader>df"] = "@function.outer",
          ["<leader>dc"] = "@class.outer",
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

