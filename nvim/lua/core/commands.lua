------------------------
-- User Defined Commands
------------------------

vim.api.nvim_create_user_command("E", "Explore", {})
vim.api.nvim_create_user_command("GC", "Git commit % -v", {})
vim.api.nvim_create_user_command("GCA", "Git commit -va", {})
vim.api.nvim_create_user_command("GP", "Git push", {})
vim.api.nvim_create_user_command("GPL", "Git pull", {})
vim.api.nvim_create_user_command("GL", "Git log", {})
vim.api.nvim_create_user_command("GLL", "Git log @{push}..", {})
