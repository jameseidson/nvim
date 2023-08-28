local set_fmt_on_save = require("config.autocmd").fmt_on_save

return {
	"mhartington/formatter.nvim",
	event = "LspAttach",
	config = function()
		local ft = require("formatter.filetypes")

		require("formatter").setup({
			["*"] = { ft.any.remove_trailing_whitespace },
			filetype = {
				javascript = { ft.javascript.prettierd },
				typescript = { ft.typescript.prettierd },
				javascriptreact = { ft.javascriptreact.prettierd },
				typescriptreact = { ft.typescriptreact.prettierd },
				html = { ft.html.prettierd },
				css = { ft.css.prettierd },
				scss = { ft.css.prettierd },
				json = { ft.json.prettierd },
				markdown = { ft.markdown.prettierd },
				lua = { ft.lua.stylua },
				rust = { ft.rust.rustfmt },
				toml = { ft.toml.taplo },
				python = { ft.python.black },
				latex = { ft.latex.latexindent },
				haskell = {
					function()
						return {
							exe = "brittany",
							args = {
								"--write-mode inplace",
							},
						}
					end,
				},
			},
		})

		set_fmt_on_save()
	end,
}
