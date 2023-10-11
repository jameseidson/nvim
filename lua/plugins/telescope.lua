local keymap = require("config.keymap").telescope

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	init = function()
		keymap.set_global(require("telescope.builtin"))
	end,
	config = true,
}
