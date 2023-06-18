local set_keymap = require("config.keymap").undotree

return {
	"mbbill/undotree",
	init = function()
		vim.g.undotree_WindowLayout = 3
		vim.g.undotree_SplitWidth = 40
		set_keymap()
	end,
}
