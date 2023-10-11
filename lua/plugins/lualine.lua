return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"linrongbin16/lsp-progress.nvim",
			opts = {},
		},
	},
	--init = function()
	--	vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
	--	vim.api.nvim_create_autocmd("User LspProgressStatusUpdated", {
	--		group = "lualine_augroup",
	--		callback = require("lualine").refresh,
	--	})
	--end,
	opts = {
		options = {
			theme = "gruvbox",
			disabled_filetypes = { "NvimTree", "undotree", "diff" },
		},
		sections = {
			lualine_c = {
				"filename",
				"require('lsp-progress').progress()",
			},
		},
	},
}
