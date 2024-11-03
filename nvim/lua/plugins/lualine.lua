return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local trouble = require 'trouble'
    local symbols = trouble.statusline {
      mode = 'lsp_document_symbols',
      groups = {},
      title = false,
      filter = { range = true },
      -- format = '{kind_icon}{symbol.name:Normal}',
      format = '{kind_icon}{symbol.name:Normal}',
      -- The following line is needed to fix the background color
      -- Set it to the lualine section you want to use
      hl_group = 'lualine_c_normal',
    }
    require('lualine').setup {
      sections = {
        lualine_c = {
          'filename',
          {
            symbols.get,
            cond = symbols.has,
          },
        },
      },
    }
  end,
}
