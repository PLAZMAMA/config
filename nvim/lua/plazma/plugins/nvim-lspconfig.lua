return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  version = 'v1.0.x',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/lazydev.nvim',
  },
  config = function()
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      -- NOTE: Remember that lua is a real programming language, and as such it is possible
      -- to define small helper and utility functions so you don't have to repeat yourself
      -- many times.
      --
      -- In this case, we create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<F2>', vim.lsp.buf.rename, 'Rename')
      nmap('<leader>ca', function()
        vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
      end, '[C]ode [A]ction')
      local telescope_builtin = require 'telescope.builtin'
      nmap('gd', telescope_builtin.lsp_definitions, '[G]oto [D]efinition')
      nmap('gr', telescope_builtin.lsp_references, '[G]oto [R]eferences')
      nmap('gI', telescope_builtin.lsp_implementations, '[G]oto [I]mplementation')
      nmap('<leader>D', telescope_builtin.lsp_type_definitions, 'Type [D]efinition')
      nmap('<leader>ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')

      -- See `:help K` for why to use this in the hober documentation keymap.
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    -- document existing key chains
    local wk = require 'which-key'
    wk.add {
      {
        { '<leader>c', desc = '[C]ode' },
        { '<leader>d', desc = '[D]ocument' },
        { '<leader>g', desc = '[G]it' },
        { '<leader>h', desc = 'Git [H]unk' },
        { '<leader>r', desc = '[R]ename' },
        { '<leader>s', desc = '[S]earch' },
        { '<leader>t', desc = '[T]oggle' },
      },
      -- register which-key VISUAL mode
      -- required for visual <leader>hs (hunk stage) to work
      {
        mode = { 'v' },
        { '<leader>', desc = 'VISUAL <leader>' },
        { '<leader>h', desc = 'Git [H]unk' },
      },
    }

    -- mason-lspconfig requires that these setup functions are called in this order
    -- before setting up the servers.
    require('mason').setup()
    require('mason-lspconfig').setup()

    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. They will be passed to
    --  the `settings` field of the server config. You must look up that documentation yourself.
    --
    --  If you want to override the default filetypes that your language server will attach to you can
    --  define the property 'filetypes' to the map in question.
    local servers = {
      clangd = {},
      -- gopls = {},
      pyright = {
        python = {
          autoImportCompletions = true,
          autoSearchPaths = true,
          diagnosticMode = 'openFilesOnly',
          typeCheckingMode = 'standard',
        },
      },
      jdtls = {},
      -- rust_analyzer = {},
      ts_ls = {
        settings = {
          npmLocation = '/opt/homebrew/bin/npm',
        },
      },
      -- html = { filetypes = { 'html', 'twig', 'hbs'} },
      lua_ls = {
        settings = {
          Lua = {
            callSnippet = 'Replace',
            telemetry = { enable = false },
            -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }
    local formatters = {
      'stylua',
      'black',
      'prettierd',
    }

    -- Insure formatted are installed
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, formatters)
    require('mason-tool-installer').setup {
      ensure_installed = ensure_installed,
    }

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}

          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for ts_ls)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
