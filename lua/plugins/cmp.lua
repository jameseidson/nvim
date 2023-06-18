local get_keymap = require("config.keymap").cmp

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"SirVer/ultisnips",
		"honza/vim-snippets",
		"quangnguyen30192/cmp-nvim-ultisnips",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["UltiSnips#Anon"](args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert(get_keymap(cmp)),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "ultisnips" },
				{ name = "nvim_lsp_signature_help" },
			}, {
				{ name = "buffer" },
			}),
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
