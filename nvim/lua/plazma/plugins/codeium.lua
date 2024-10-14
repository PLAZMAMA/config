return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    vim.g.codeium_disable_bindings = 1
    vim.keymap.set('i', '<C-a>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](1) end,
      { expr = true, silent = true })
    vim.keymap.set('i', '<M-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
      { expr = true, silent = true })
    vim.keymap.set('i', '<M-c>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    vim.keymap.set('n', '<leader>mt', function() vim.g.codeium_enabled = not vim.g.codeium_enabled end,
      { expr = true, silent = true })

    local wk = require("which-key")
    wk.add({
      ['<leader>mt'] = { name = '[M]atrix(codeium) [T]oggle', _ = 'which_key_ignore' },
    })
  end,
}
