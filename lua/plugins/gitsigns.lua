local keymap = require("config.keymap").gitsigns

return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			keymap.set_global(package.loaded.gitsigns, bufnr)
		end,
	},
	config = true,
}
