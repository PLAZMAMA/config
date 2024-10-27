return {
  'numToStr/Comment.nvim',
  version = 'v0.8.x',
  opts = {},
  config = function()
    require('Comment').setup {
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
        ---Line-comment toggle keymap
        line = '<C-/><C-/>',
        ---Block-comment toggle keymap
        block = '<C-/><C-/>',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = '<C-/>',
        ---Block-comment keymap
        block = '<C-/>',
      },
      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        ---Operator-pending mapping; Defaults Ex: `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; Defaults Ex: `gco`, `gcO`, `gcA`
        extra = false,
      },
    }
  end,
}
