return {
  'ThePrimeagen/harpoon',
  version = '*',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local keymap = vim.keymap
    local harpoon = require 'harpoon'

    harpoon:setup()
    keymap.set('n', '<leader>a', function()
      harpoon:list():add()
      vim.api.nvim_exec_autocmds('User', { pattern = 'HarpoonAdd' })
    end)
    keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    keymap.set('n', '<C-7>', function()
      harpoon:list():select(1)
    end)
    keymap.set('n', '<C-8>', function()
      harpoon:list():select(2)
    end)
    keymap.set('n', '<C-9>', function()
      harpoon:list():select(3)
    end)
    keymap.set('n', '<C-0>', function()
      harpoon:list():select(4)
    end)
    -- document existing key chains
    local wk = require 'which-key'
    wk.add {
      {
        mode = { 'n' },
        { '<leader>a', desc = '[A]dd file to Harpoon' },
        { '<C-e>', desc = 'Toggle Harpoon menue' },
        { '<C-7>', desc = 'Go to Harpoon first file' },
        { '<C-8>', desc = 'Go to Harpoon second file' },
        { '<C-9>', desc = 'Go to Harpoon third file' },
        { '<C-0>', desc = 'Go to Harpoon fourth file' },
      },
    }
  end,
}
