return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {desc = "Opens undotree."})
        vim.g.undotree_DiffCommand = "FC"
    end,
}
