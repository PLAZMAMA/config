-- TODO: Add a custom python snippet: `inspect(local=locals())`
-- Snippet Engine & its associated nvim-cmp source
return {
  'L3MON4D3/LuaSnip',
  build = function()
    -- Build Step is needed for regex support in snippets
    -- This step is not supported in many windows environments
    -- Remove the below condition to re-enable on windows
    if vim.fn.has 'win32' == 1 then
      return
    end
    return 'make install_jsregexp'
  end,
  dependencies = {
    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',
  },
}
