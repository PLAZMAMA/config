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

-- Updates the harpoon indicator when writing in the harpoon window or in general. This time not override the whole write command :)
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
    pattern = "*",
    callback = updateHarpoonIndicator,
})

-- Updates the harpoon indicator when adding files to harpoon.
vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "HarpoonAdd",
    callback = updateHarpoonIndicator,
})

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "folke/trouble.nvim", "ThePrimeagen/harpoon" },
    config = function()
        local trouble = require("trouble")
        local symbols = trouble.statusline({
            mode = "lsp_document_symbols",
            groups = {},
            title = false,
            filter = { range = true },
            -- format = '{kind_icon}{symbol.name:Normal}',
            format = "{kind_icon}{symbol.name:Normal}",
            -- The following line is needed to fix the background color
            -- Set it to the lualine section you want to use
            hl_group = "lualine_c_normal",
        })
        require("lualine").setup({
            sections = {
                lualine_c = {
                    "filename",
                    {
                        symbols.get,
                        cond = symbols.has,
                    },
                },
                lualine_x = { harpoonStatusline },
            },
        })
    end,
}
