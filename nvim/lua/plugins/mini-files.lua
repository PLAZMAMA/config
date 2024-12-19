return {
    "echasnovski/mini.files",
    enabled = false,
    version = false,
    config = function()
        require("mini.files").setup({})
        vim.keymap.set(
            "n",
            "<leader>o",
            MiniFiles.open,
            { desc = "[O]pen file explorer" }
        )
    end
}
