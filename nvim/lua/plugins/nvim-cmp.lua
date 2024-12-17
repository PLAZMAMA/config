return {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    commit = "ae644feb7b67bf1ce4260c231d1d4300b19c6f30",
    event = "InsertEnter",
    dependencies = {
        -- Adds LSP completion capabilities
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        -- See `:help cmp`
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            mapping = cmp.mapping.preset.insert({
                ["<A-p>"] = cmp.mapping.scroll_docs(-4),
                ["<A-n>"] = cmp.mapping.scroll_docs(4),
                ["<C-y>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
                ["<C-n>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-p>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            },
        })

        local wk = require("which-key")
        wk.add({
            {
                { "<A-p>", desc = "Scroll docs up" },
                { "<A-n>", desc = "Scroll docs down" },
                { "<TAB>", desc = "Accept completion" },
                { "<C-n>", desc = "Next completion/Snippet input place" },
                { "<C-p>", desc = "Previous completion/Snippet input place" },
            },
        })
    end,
}
