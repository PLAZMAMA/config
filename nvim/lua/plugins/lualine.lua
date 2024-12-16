-- returns a harpoon icon if the current file is marked in Harpoon. Does not
-- `require` Harpoon itself (allowing harpoon to still be lazy-loaded)
local function update_harpoon()
    -- Get current market files
    local harpoon = require("harpoon")
    local pwd = vim.uv.cwd()
    if not pwd then
        return
    end

    -- Update harpoon statusline (marks and files)
    vim.b.harpoon_mark = "" -- empty by default
    local marked_files = harpoon:list():display()
    local current_file = vim.api.nvim_buf_get_name(0)
    local marked_file_names = {}
    for _, file in pairs(marked_files) do
        local abs_path = file
        if string.sub(abs_path, 1, 1) ~= "/" then
            abs_path = pwd .. "/" .. abs_path
        end
        if abs_path == current_file then
            vim.b.harpoon_mark = "󰛢"
        end
        table.insert(marked_file_names, vim.fs.basename(file))
    end
    vim.g.marked_file_names = marked_file_names
end

local function harpoon_mark()
    return vim.b.harpoon_mark or ""
end

local function harpoon_files()
    local marked_files = ""
    -- Harpoon's corresponding CTRL number starts at 7.
    -- Hence for the first index, it will be 6 + 1 = 7.
    -- For the second it will be 6 + 2 = 8.
    -- and so on...
    local start_indx = 6
    for key, value in pairs(vim.g.marked_file_names) do
        marked_files = marked_files .. key + start_indx .. ":" .. value .. " "
    end
    -- Center files in statusline
    local progress_len = 3 -- Complete guess
    local lualine_padding = 14 -- Through trial and error
    local used_space = vim.o.columns - (#marked_files + #vim.b.harpoon_mark + progress_len + lualine_padding)
    local padding = string.rep(" ", used_space/2, "")
    return (marked_files .. padding) or ""
end

-- Updates the harpoon indicator when writing in the harpoon window or in general. This time not override the whole write command :)
local harpoon_autogroup = vim.api.nvim_create_augroup("HarpoonUpdate", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
    group = harpoon_autogroup,
    pattern = "*",
    callback = update_harpoon,
})

-- Updates the harpoon indicator when adding files to harpoon.
vim.api.nvim_create_autocmd({ "User" }, {
    group = harpoon_autogroup,
    pattern = "HarpoonAdd",
    callback = update_harpoon,
})

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "ThePrimeagen/harpoon" },
    config = function()
        require("lualine").setup({
            sections = {
                lualine_x = { harpoon_files },
                lualine_y = { harpoon_mark },
                lualine_z = { "progress" },
            },
        })
    end,
}
