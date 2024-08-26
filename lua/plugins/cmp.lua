return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    -- I have no idea why, but if this line isn't here, pressing <Tab> does not select the next completion item until
    -- the second time insert mode is entered in a buffer.
    -- local _ = require("luasnip")

    opts.mapping = {
      ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
      ["<S-CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(8)),
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-8)),
    }

    opts.preselect = cmp.PreselectMode.Item

    opts.sources = cmp.config.sources({
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 500 },
      { name = "buffer", priority = 100 },
    })

    cmp.config.compare.locality.lines_count = 300
    opts.sorting = {
      comparators = {
        cmp.config.compare.locality,
        cmp.config.compare.recently_used,
        cmp.config.compare.score,
        cmp.config.compare.offset,
        cmp.config.compare.exact,
      },
    }
  end,
}
