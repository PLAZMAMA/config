return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    event = "InsertEnter",
    version = "v1.*",
    opts = {
        keymap = { preset = "default" },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "normal",
        },

        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
            default = { "lsp", "path", "snippets", "buffer", "codecompanion" },
            providers = {
                codecompanion = {
                    name = "CodeCompanion",
                    module = "codecompanion.providers.completion.blink",
                    enabled = true,
                },
            },
        },

        -- experimental signature help support
        signature = { enabled = true },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" },
}
