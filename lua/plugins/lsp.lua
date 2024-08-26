return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      clangd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      },
    },
  },
}
