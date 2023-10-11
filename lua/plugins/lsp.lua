local keymap = require("config.keymap").lsp

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/neodev.nvim",
	},
	init = function()
		require("neodev").setup()
	end,
	config = function()
		local lsp = require("lspconfig")

		lsp.hdl_checker.setup({
			cmd = { "hdl_checker", "--lsp" },
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				keymap.set_global(ev.buf)
			end,
		})
	end,
}
