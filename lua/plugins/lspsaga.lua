local keymap = require("config.keymap").lspsaga

return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	event = "LspAttach",
	init = keymap.set_global,
	opts = {
		hover = {
			open_browser = "!firefox",
		},
	},
	config = true,
}
