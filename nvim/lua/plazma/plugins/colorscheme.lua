return {
    -- Favorite theme
    {
        "folke/tokyonight.nvim",
        version = 'v4.8.x',
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup {
                style = "night",
                transparent = true, -- Enable this to disable setting the background color
                styles={
                    sidebars = "transparent",
                    floats = "transparent",
                },
                on_colors = function(colors)
                    colors.fg_gutter = colors.blue0
                end,
            }
            require("tokyonight").load()
        end,
    },
}
