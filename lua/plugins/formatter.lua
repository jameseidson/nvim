local set_fmt_on_save = require("config.autocmd").fmt_on_save

return {
	"mhartington/formatter.nvim",
	event = "LspAttach",
	config = function()
		local ft = require("formatter.filetypes")

		require("formatter").setup({
			["*"] = { ft.any.remove_trailing_whitespace },
			filetype = {
				javascript = { ft.javascript.prettier },
				typescript = { ft.typescript.prettier },
				javascriptreact = { ft.javascriptreact.prettier },
				html = { ft.html.prettier },
				css = { ft.css.prettier },
				scss = { ft.css.prettier },
				json = { ft.json.prettier },
				markdown = { ft.markdown.prettier },
				lua = { ft.lua.stylua },
				rust = { ft.rust.rustfmt },
				python = { ft.python.black },
			},
		})

		set_fmt_on_save()
	end,
}
