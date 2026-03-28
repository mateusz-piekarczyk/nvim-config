
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
      { "]m", "Next function start (TS)", mode = "n" },
      { "]M", "Next function end (TS)",   mode = "n" },
      { "]]", "Next class start (TS)",    mode = "n" },
      { "][", "Next class end (TS)",      mode = "n" },
      { "]b", "Next block start (TS)",    mode = "n" },
      { "]B", "Next block end (TS)",      mode = "n" },
      { "]a", "Next parameter (TS)",      mode = "n" },
      { "]A", "Next parameter end (TS)",  mode = "n" },
      { "gj", "Next function start (TS)", mode = "n" },
      { "gJ", "Next function end (TS)",   mode = "n" },

      { "[m", "Prev function start (TS)", mode = "n" },
      { "[M", "Prev function end (TS)",   mode = "n" },
      { "[[", "Prev class start (TS)",    mode = "n" },
      { "[]", "Prev class end (TS)",      mode = "n" },
      { "[b", "Prev block start (TS)",    mode = "n" },
      { "[B", "Prev block end (TS)",      mode = "n" },
      { "[a", "Prev parameter (TS)",      mode = "n" },
      { "[A", "Prev parameter end (TS)",  mode = "n" },
      { "gk", "Prev function start (TS)", mode = "n" },
      { "gK", "Prev function end (TS)",   mode = "n" },
    })

    -- Operator-pending + Visual: Treesitter textobjects.select
    wk.add({
      { "af", "Around function", mode = { "o", "x" } },
      { "if", "Inside function", mode = { "o", "x" } },
      { "ac", "Around class",    mode = { "o", "x" } },
      { "ic", "Inside class",    mode = { "o", "x" } },
      { "ab", "Around block",    mode = { "o", "x" } },
      { "ib", "Inside block",    mode = { "o", "x" } },
      { "al", "Around loop",     mode = { "o", "x" } },
      { "il", "Inside loop",     mode = { "o", "x" } },
      { "a/", "Around comment",  mode = { "o", "x" } },
      { "i/", "Inside comment",  mode = { "o", "x" } },
      { "aa", "Around parameter",mode = { "o", "x" } },
      { "ia", "Inside parameter",mode = { "o", "x" } },
    })
  end,
}

