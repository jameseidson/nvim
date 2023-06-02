local set_keymap = require("config.keymap").telescope

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.1",
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function()
    set_keymap(require("telescope.builtin"))
  end,
  config = true,
}
