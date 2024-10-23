-- Highlight, edit, and navigate code
return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    version = '0.24.x',
    opts = {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = {
            'c',
            'cpp',
            'go',
            'lua',
            'python',
            'rust',
            'tsx',
            'javascript',
            'typescript',
            'vimdoc',
            'vim',
            'bash',
            'gitcommit',
            'markdown',
            'markdown_inline',
        },
        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = true,
        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- List of parsers to ignore installing
        ignore_install = {},
        -- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
        modules = {},
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<c-space>',
                node_incremental = '<c-space>',
                scope_incremental = '<c-s>',
                node_decremental = '<M-space>',
            },
        },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
        vim.treesitter.language.add('markdown', {filetype= 'vimwiki' })
    end
}
