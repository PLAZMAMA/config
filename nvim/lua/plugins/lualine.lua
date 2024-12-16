---returns a harpoon icon if the current file is marked in Harpoon. Does not
---`require` Harpoon itself (allowing harpoon to still be lazy-loaded)
local function updateHarpoonIndicator()
    local harpoon = require("harpoon")
    vim.b.harpoonMark = "" -- empty by default
    local pwd = vim.uv.cwd()
    if not pwd then
        return
    end
    local marked_files = harpoon:list():display()
    local current_file = vim.fn.expand("%:p")
    for _, file in pairs(marked_files) do
        local abs_path = pwd .. "/" .. file
        if abs_path == current_file then
            vim.b.harpoonMark = "󰛢"
        end
    end
end

local function harpoonStatusline()
    return vim.b.harpoonMark or ""
end

local harpoon_autogroup = vim.api.nvim_create_augroup("HarpoonStatusline", {clear=true})
-- Updates the harpoon indicator when writing in the harpoon window or in general. This time not override the whole write command :)
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
    group = harpoon_autogroup,
    pattern = "*",
    callback = updateHarpoonIndicator,
})

-- Updates the harpoon indicator when adding files to harpoon.
vim.api.nvim_create_autocmd({ "User" }, {
    group = harpoon_autogroup,
    pattern = "HarpoonAdd",
    callback = updateHarpoonIndicator,
})

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "ThePrimeagen/harpoon" },
    config = function()
        require("lualine").setup({
            sections = {
                lualine_x = { harpoonStatusline },
            },
        })
    end,
}
