return {
    "mbbill/undotree",
    version = "rel_6.1",
    config = function()
        vim.keymap.set(
            "n",
            "<leader>u",
            vim.cmd.UndotreeToggle,
            { desc = "Opens undotree." }
        )
        vim.g.undotree_DiffpanelHeight = 0
        vim.g.undotree_DiffAutoOpen = 0
        if string.match(vim.uv.os_uname().sysname, "Windows") then
            vim.g.undotree_DiffCommand = "FC"
        else
            vim.g.undotree_DiffCommand = "diff"
        end
    end,
}
