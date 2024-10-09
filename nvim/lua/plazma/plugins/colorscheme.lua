return {
    -- Favorite theme
    {
        "folke/tokyonight.nvim",
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
