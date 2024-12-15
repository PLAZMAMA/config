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
        if string.match(vim.uv.os_uname().sysname, "Windows") then
            vim.g.undotree_DiffCommand = "FC"
        else
            vim.g.undotree_DiffCommand = "diff"
        end
        -- g:UndootreeDiffpanelHeight = 0
    end,
}
