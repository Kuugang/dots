return {
  "GCBallesteros/jupytext.nvim",
  config = true,
  config = function()
    require("jupytext").setup({
      style = "markdown",
      output_extension = "md",
      force_ft = "markdown",
    })
  end,
}
