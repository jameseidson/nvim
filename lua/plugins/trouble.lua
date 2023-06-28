local keymap = require("config.keymap").trouble
return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = keymap.set_global(),
}
