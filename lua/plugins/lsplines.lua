local keymap = require("config.keymap").lsplines

return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	init = function()
		vim.diagnostic.config({ virtual_text = false, virtual_lines = false })
		keymap.set_global()
	end,
	opts = {},
}
