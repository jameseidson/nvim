return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		vim.cmd("TSUpdate")
	end,
	opts = {
		ensure_installed = { "markdown", "markdown_inline" },
		auto_install = true,
		highlight = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
