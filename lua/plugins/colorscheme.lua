return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = { contrast = "hard" },
		config = function(_, opts)
			require("gruvbox").setup(opts)
			vim.cmd("colorscheme gruvbox")
		end,
	},
	{
		"neanias/everforest-nvim",
		lazy = true,
		opts = { background = "hard" },
		config = function(_, opts)
			require("everforest").setup(opts)
		end,
	},
	{
		"catppuccin/nvim",
		lazy = true,
	},

	{
		"pineapplegiant/spaceduck",
		lazy = true,
	},
	{
		"rose-pine/neovim",
		lazy = true,
	},
}
