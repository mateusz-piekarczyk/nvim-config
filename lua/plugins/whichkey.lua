
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Groups (show up when you hit `]` or `[`)
    wk.add({
      { "]", group = "Next (TS)", mode = "n" },
      { "[", group = "Prev (TS)", mode = "n" },
      { "g", group = "Goto (TS/LSP)", mode = "n" },
    })

    -- Normal mode: Treesitter textobjects.move
    wk.add({
      { "]m", desc = "Next function start (TS)", mode = "n" },
      { "]M", desc = "Next function end (TS)",   mode = "n" },
      { "]]", desc = "Next class start (TS)",    mode = "n" },
      { "][", desc = "Next class end (TS)",      mode = "n" },
      { "]b", desc = "Next block start (TS)",    mode = "n" },
      { "]B", desc = "Next block end (TS)",      mode = "n" },
      { "]a", desc = "Next parameter (TS)",      mode = "n" },
      { "]A", desc = "Next parameter end (TS)",  mode = "n" },
      { "gj", desc = "Next function start (TS)", mode = "n" },
      { "gJ", desc = "Next function end (TS)",   mode = "n" },

      { "[m", desc = "Prev function start (TS)", mode = "n" },
      { "[M", desc = "Prev function end (TS)",   mode = "n" },
      { "[[", desc = "Prev class start (TS)",    mode = "n" },
      { "[]", desc = "Prev class end (TS)",      mode = "n" },
      { "[b", desc = "Prev block start (TS)",    mode = "n" },
      { "[B", desc = "Prev block end (TS)",      mode = "n" },
      { "[a", desc = "Prev parameter (TS)",      mode = "n" },
      { "[A", desc = "Prev parameter end (TS)",  mode = "n" },
      { "gk", desc = "Prev function start (TS)", mode = "n" },
      { "gK", desc = "Prev function end (TS)",   mode = "n" },
    })

    -- Operator-pending + Visual: Treesitter textobjects.select
    wk.add({
      { "af", desc = "Around function", mode = { "o", "x" } },
      { "if", desc = "Inside function", mode = { "o", "x" } },
      { "ac", desc = "Around class",    mode = { "o", "x" } },
      { "ic", desc = "Inside class",    mode = { "o", "x" } },
      { "ab", desc = "Around block",    mode = { "o", "x" } },
      { "ib", desc = "Inside block",    mode = { "o", "x" } },
      { "al", desc = "Around loop",     mode = { "o", "x" } },
      { "il", desc = "Inside loop",     mode = { "o", "x" } },
      { "a/", desc = "Around comment",  mode = { "o", "x" } },
      { "i/", desc = "Inside comment",  mode = { "o", "x" } },
      { "aa", desc = "Around parameter",mode = { "o", "x" } },
      { "ia", desc = "Inside parameter",mode = { "o", "x" } },
    })
  end,
}
