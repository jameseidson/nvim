local set_keymap = require("config.keymap").lspsaga

return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
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
