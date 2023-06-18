local set_keymap = require("config.keymap").tree

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function()
		set_keymap(require("nvim-tree.api").tree)
	end,
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		require("nvim-tree").setup()
	end,
}
