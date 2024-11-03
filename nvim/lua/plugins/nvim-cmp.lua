return {
  -- Autocompletion
  "hrsh7th/nvim-cmp",
  commit = 'ae644feb7b67bf1ce4260c231d1d4300b19c6f30',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        -- Build Step is needed for regex support in snippets
        -- This step is not supported in many windows environments
        -- Remove the below condition to re-enable on windows
        if vim.fn.has "win32" == 1 then
          return
        end
        return "make install_jsregexp"
      end)(),
    },
    "saadparwaiz1/cmp_luasnip",

    -- Adds LSP completion capabilities
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",

    -- Adds a number of user-friendly snippets
    "rafamadriz/friendly-snippets",
  },
  config = function()
    -- See `:help cmp`
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp.mapping.preset.insert {
        ["<A-Up>"] = cmp.mapping.scroll_docs(-4),
        ["<A-Down>"] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      },
    }

    -- The line beneath this is called `modeline`. See `:help modeline`
    -- vim: ts=2 sts=2 sw=2 et
    local wk = require("which-key")
    wk.add({
      {
        { '<A-Up>', desc = "Scroll docs up" },
        { '<A-Down>', desc = "Scroll docs down" },
        { '<leader>od', desc = "[O]pen [D]ocs" },
      }
    })
  end,
}
