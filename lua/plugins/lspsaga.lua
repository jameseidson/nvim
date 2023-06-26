local keymap = require("config.keymap").lspsaga
local local_keymaps = keymap.get_local()

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
		finder = {
			keys = local_keymaps.finder,
		},
		definition = local_keymaps.definition,
		code_action = {
			keys = local_keymaps.code_action,
		},
		hover = {
			open_browser = "!firefox",
		},
	},
	config = true,
}
