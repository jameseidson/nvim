local keymap = require("config.keymap").trouble

return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function()
		keymap.set_global()
	end,
	opts = {},
}
