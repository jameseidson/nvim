local keymap = require("config.keymap").aerial

return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	init = keymap.set_global,
	opts = {
		on_attach = function(bufnr)
			keymap.set_local()
		end,
	},
	config = true,
}
