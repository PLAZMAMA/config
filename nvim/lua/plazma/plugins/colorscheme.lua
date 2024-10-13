return {
    -- Favorite theme
    {
        "folke/tokyonight.nvim",
        version = 'v4.8.x',
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup {
                style = "moon",
                transparent = true, -- Enable this to disable setting the background color
                styles={
                    sidebars = "transparent",
                    floats = "transparent",
                },
            }
            require("tokyonight").load()
        end,
    },
}
