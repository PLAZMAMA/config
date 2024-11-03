return {
  'williamboman/mason.nvim',
  version = '1.x.x',
  dependencies = {
    'nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup()
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
