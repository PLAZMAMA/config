return {
  'vimwiki/vimwiki',
  version = 'v2024.01.24',
  event = 'BufEnter *.md',
  keys = { '<leader>ww', '<leader>wt' },
  init = function()
    vim.g.vimwiki_folding = ''
    vim.g.vimwiki_list = {
      {
        path = '~/Documents/plazmama.github.io/',
        syntax = 'markdown',
        ext = '.md',
        index = 'README',
      },
    }
    vim.g.vimwiki_ext2syntax = {
      ['.md'] = 'markdown',
    }
    vim.filetype.add {
      extension = {
        wiki = 'markdown',
      },
    }
  end,
}
