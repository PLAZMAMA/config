return {
    "PLAZMAMA/kiwi.nvim",
    lazy = true,
    opts = {
        {
            name = "wiki",
            path = "~/Documents/plazmama.github.io/",
        },
    },
    keys = {
        {
            "<leader>ww",
            ':lua require("kiwi").open_wiki_index()<cr>',
            desc = "Open Wiki index",
        },
        { "T", ':lua require("kiwi").todo.toggle()<cr>', desc = "Toggle Markdown Task" },
    },
}
