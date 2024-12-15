-- Snippet Engine & its associated nvim-cmp source
return {
    "L3MON4D3/LuaSnip",
    version = "v2.x.x",
    build = function()
        -- Build Step is needed for regex support in snippets
        -- This step is not supported in many windows environments
        -- Remove the below condition to re-enable on windows
        if vim.fn.has("win32") == 1 then
            return
        end
        return "make install_jsregexp"
    end,
    config = function()
        local luasnip = require("luasnip")
        local s = luasnip.snippet
        local t = luasnip.text_node
        require("luasnip.loaders.from_vscode").lazy_load()
        luasnip.config.setup({})

        ------------------
        -- Custom snippets
        ------------------

        -- Python
        luasnip.add_snippets("python", { s("intr", t("interact(local=locals())")) })
    end,
    dependencies = {
        -- Adds a number of VSCode-like user-friendly snippets
        "rafamadriz/friendly-snippets",
    },
}
