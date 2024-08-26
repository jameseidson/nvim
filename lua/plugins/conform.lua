return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      clang_format = {
        inherit = true,
        prepend_args = { "-style={ AllowShortLoopsOnASingleLine: true, AllowShortBlocksOnASingleLine: true }" },
      },
    },
    formatters_by_ft = {
      ["cpp"] = { "clang_format" },
      ["c"] = { "clang_format" },
      ["javascript"] = { "prettierd" },
      ["javascriptreact"] = { "prettierd" },
      ["typescript"] = { "prettierd" },
      ["typescriptreact"] = { "prettierd" },
      ["vue"] = { "prettierd" },
      ["css"] = { "prettierd" },
      ["scss"] = { "prettierd" },
      ["less"] = { "prettierd" },
      ["html"] = { "prettierd" },
      ["json"] = { "prettierd" },
      ["jsonc"] = { "prettierd" },
      ["yaml"] = { "prettierd" },
      ["markdown"] = { "prettierd" },
      ["markdown.mdx"] = { "prettierd" },
      ["graphql"] = { "prettierd" },
      ["handlebars"] = { "prettierd" },
      ["bzl"] = { "buildifier" },
    },
  },
}
