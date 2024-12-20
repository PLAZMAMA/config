return {
    -- Make sure to set this up properly if you have lazy=true
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = true,
    version = "v7.x.x",
    ft = { "markdown", "vimwiki", "codecompanion" },
    config = function()
        require("render-markdown").setup {
            render_modes = true,
        }
    end,
}
