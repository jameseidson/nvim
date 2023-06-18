local setup_fmt_on_save = require("config.autocmd").fmt_on_save

return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      filetype = {
        javascript = { require("formatter.filetypes.javascript").prettier },
        typescript = { require("formatter.filetypes.typescript").prettier },
        javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
        html = { require("formatter.filetypes.html").prettier },
        css = { require("formatter.filetypes.css").prettier },
        json = { require("formatter.filetypes.json").prettier },
        markdown = { require("formatter.filetypes.markdown").prettier },
        lua = { require("formatter.filetypes.lua").stylua },
        rust = { require("formatter.filetypes.rust").rustfmt },
      }
    })

    setup_fmt_on_save()
  end
}
