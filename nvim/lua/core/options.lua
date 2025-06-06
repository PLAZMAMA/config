-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Makes jump list a stack(aka doesn't eliminate repeated jumps)
vim.o.jumpoptions = "stack"

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Set tabs to 4
-- :set noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Disable "--Insert--" at the command space because statusline already shows the mode, so its redundant.
vim.opt.showmode = false

-- Set up the match for lines longer than 80 characters
-- vim.fn.matchadd("ErrorMsg", "\\%>90v.\\+")

vim.o.diffopt = "internal,filler,closeoff,linematch:60"

-- Setup diagnostic popup when jumping between them
vim.diagnostic.config({ jump = { float = true }})
