local set_keymap = require("config.keymap").lspsaga

return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons"     },
    { "nvim-treesitter/nvim-treesitter" },
  },
  event = "LspAttach",
  init = set_keymap,
  opts = {
    hover = {
      open_browser = "!firefox",
    },
  },
  config = true,
}
