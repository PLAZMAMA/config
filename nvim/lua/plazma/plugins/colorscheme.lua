return {
  -- Favorite theme
  {
    'folke/tokyonight.nvim',
    version = 'v4.8.x',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        style = 'night',
        transparent = true, -- Enable this to disable setting the background color
        styles = {
          sidebars = 'transparent',
          floats = 'transparent',
        },
        on_colors = function(colors)
          colors.fg_gutter = colors.blue0
          colors.comment = '#b04700'
        end,
        on_highlights = function(hl, colors)
          hl.LspReferenceText = { bg = '', underline = true }
          hl.LspReferenceRead = { bg = '', underline = true }
          hl.LspReferenceWrite = { bg = '', underline = true }
          hl.TreesitterContext = { bg = '' }
          hl['@constructor.tsx'] = { link = '@tag.tsx' } -- Solution to JSX problem found in GitHub discussions, if I ever use it, cool!
        end,
      }
      require('tokyonight').load()
    end,
  },
}
