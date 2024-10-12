return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {desc = "Opens undotree."})
        if vim.fn.has('win32')
        then 
            vim.g.undotree_DiffCommand = "FC"
        else 
            vim.g.undotree_DiffCommand = "diff"
        end
    end,
}
