local set_keymap = require("config.keymap").lsp

return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    { "neovim/nvim-lspconfig"               },
    {
      "williamboman/mason.nvim",
      build = function()
        vim.cmd("MasonUpdate")
      end,
    },
    { "williamboman/mason-lspconfig.nvim"   },
    { "hrsh7th/nvim-cmp"                    },
    { "hrsh7th/cmp-nvim-lsp"                },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "L3MON4D3/LuaSnip"                    },
  },
  config = function()
    local lsp = require("lsp-zero")
    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    lsp.preset("recommended")

    lsp.setup_nvim_cmp({
      sources = {
        { name = "nvim_lsp"                },
        { name = "luasnip"                 },
        { name = "buffer"                  },
        { name = "nvim_lsp_signature_help" },
      },
      mapping = lsp.defaults.cmp_mappings({
        ["<C-k>"]     = cmp.mapping.select_prev_item(cmp_select),
        ["<C-j>"]     = cmp.mapping.select_next_item(cmp_select),
        ["<Tab>"]     = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })
    })

    lsp.on_attach(set_keymap)
    lsp.nvim_workspace()
    lsp.setup()
  end,
}
