return {
  "neovim/nvim-lspconfig",
  opts = {
    capabilities = {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = false,
          },
        },
      },
    },
    servers = {
      clangd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      },
    },
  },
}
