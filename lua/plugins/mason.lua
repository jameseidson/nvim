return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	build = ":MasonUpdate",
	config = function()
		local mlsp = require("mason-lspconfig")

		require("mason").setup()

		mlsp.setup()
		mlsp.setup_handlers({
			function(server)
				require("lspconfig")[server].setup({})
			end,
		})
	end,
}
