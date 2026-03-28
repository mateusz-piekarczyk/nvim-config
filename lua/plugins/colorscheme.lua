return {
  --"tiagovla/tokyodark.nvim",
  "folke/tokyonight.nvim",
  opts = {
    style = "storm",
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  lazy = false,
  priority = 1000,
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd("colorscheme tokyonight")
  end,
}
