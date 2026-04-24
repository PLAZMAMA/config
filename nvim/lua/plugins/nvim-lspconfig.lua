return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    version = "v2.x.x",
    dependencies = {
        -- "williamboman/mason.nvim",
        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { "j-hui/fidget.nvim", opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        "folke/lazydev.nvim",
    },
    opts = {
        servers = {
            clangd = {},
            basedpyright = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "openFilesOnly",
                    useLibraryCodeForTypes = true,
                },
            },
            -- ts_ls = {
            --     settings = {
            --         npmLocation = "/opt/homebrew/bin/npm",
            --     },
            -- },
            -- html = { filetypes = { 'html', 'twig', 'hbs'} },
            lua_ls = {
                settings = {
                    Lua = {
                        callSnippet = "Replace",
                        telemetry = { enable = false },
                        -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                        diagnostics = {
                            disable = {
                                "missing-fields",
                                "unused-local",
                                "unused-function",
                            },
                        },
                    },
                },
            },
            ruff = { autostart = false, },
            ocamllsp = {},
        },
    },
    config = function()
        --  This function gets run when an LSP connects to a particular buffer.
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(
                        mode,
                        keys,
                        func,
                        { buffer = event.buf, desc = "LSP: " .. desc }
                    )
                end

                local fzf = require("fzf-lua")
                map("gd", fzf.lsp_definitions, "[G]oto [D]efinition")
                map("gr", fzf.lsp_references, "[G]oto [R]eferences")
                map("gI", fzf.lsp_implementations, "[G]oto [I]mplementation")
                map("<leader>D", fzf.lsp_typedefs, "Type [D]efinition")
                map("<leader>ss", fzf.lsp_document_symbols, "[S]earch Document [S]ymbols")
                map("<leader>ws", fzf.lsp_live_workspace_symbols, "[W]orkspace [S]ymbols")
                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

                -- Makes sure the lsp has the highlight feature needed for the two autocommands below.
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if
                    not (
                        client
                        and client.supports_method(
                            vim.lsp.protocol.Methods.textDocument_documentHighlight
                        )
                    )
                then
                    return
                end
                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local highlight_augroup =
                    vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.clear_references,
                })

                vim.api.nvim_create_autocmd("LspDetach", {
                    group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                    callback = function(event2)
                        vim.lsp.buf.clear_references()
                        vim.api.nvim_clear_autocmds {
                            group = "lsp-highlight",
                            buffer = event2.buf,
                        }
                    end,
                })
            end,
        })
    end,
}
