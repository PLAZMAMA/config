local term = require("core.term")

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set(
    "n",
    "<leader>e",
    vim.diagnostic.open_float,
    { desc = "Open floating diagnostic message" }
)
vim.keymap.set(
    "n",
    "<leader>q",
    vim.diagnostic.setloclist,
    { desc = "Open diagnostics list" }
)

-- Remapping integrated terminal binding
vim.keymap.set("t", "<C-6>", function()
    vim.api.nvim_cmd({ cmd = "e", args = { "#" } }, {})
end, { desc = "Go to previous file" })
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set({ "n", "i" }, "<C-j>", term.open_terminal, { desc = "Open terminal" })
vim.keymap.set({ "n", "i" }, "<C-l>", function()
    term.open_terminal("!!")
end, { desc = "Open terminal and run last command" })
