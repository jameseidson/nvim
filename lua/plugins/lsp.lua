return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/neodev.nvim",
  },
  init = function()
    require("neodev").setup()
  end,
}
