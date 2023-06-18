local set_fmt_on_save = require("config.autocmd").fmt_on_save

return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  event = "LspAttach",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.rustfmt,
      },

      on_attach = set_fmt_on_save,
    })
  end,
}
