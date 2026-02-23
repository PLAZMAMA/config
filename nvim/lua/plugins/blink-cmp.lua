return {
    "saghen/blink.cmp",
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
            default = { "lsp", "path", "buffer" },
        },

        -- experimental signature help support
        signature = { enabled = true },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" },
}
