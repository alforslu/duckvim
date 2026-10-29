return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- NOTE: Language servers
                ensure_installed = {
                    "clangd",
                    "lua_ls",
                    "html",
                    "cssls",
                    "eslint",
                    -- "ts_ls",
                    "tailwindcss",
                    -- "basedpyright",
                    -- "pylsp",
                    "pyright",
                }, -- Auto is enabled
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Automatically set up capabilities
            -- local capabilities = require("blink.cmp").get_lsp_capabilities()
            vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })

            -- We just want to do this if LSP is enabled for the file
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    --  To jump back, press <C-t>.
                    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                    map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
                    -- MOVED TO AVOID DOUBLE WORK, see keymaps.lua
                    -- vim.keymap.set("n", "<C-f>", function()
                    --     vim.lsp.buf.format({ async = true })
                    -- end, { desc = "Format file" })

                    -- Fuzzy find all the symbols in your current workspace.
                    --  Similar to document symbols, except searches over your entire project.
                    map(
                        "<leader>ws",
                        require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        "[W]orkspace [S]ymbols"
                    )

                    -- The following two autocommands are used to highlight references of the
                    -- word under your cursor when your cursor rests there for a little while.
                    -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client:supports_method("textDocument/documentHighlight", event.buf) then
                        local group = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })

                        vim.api.nvim_clear_autocmds({ group = group, buffer = event.buf })

                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            group = group,
                            buffer = event.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            group = group,
                            buffer = event.buf,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd("LspDetach", {
                            group = group,
                            buffer = event.buf,
                            callback = function(detach)
                                for _, remaining in
                                ipairs(vim.lsp.get_clients({
                                    bufnr = detach.buf,
                                    method = "textDocument/documentHighlight",
                                }))
                                do
                                    if remaining.id ~= detach.data.client_id then
                                        return
                                    end
                                end

                                vim.lsp.util.buf_clear_references(detach.buf)
                                vim.api.nvim_clear_autocmds({
                                    group = group,
                                    buffer = detach.buf,
                                })
                            end,
                        })
                    end

                    -- The following code creates a keymap to toggle inlay hints in your
                    -- code, if the language server you are using supports them
                    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })

                        map("<leader>th", function()
                            vim.lsp.inlay_hint.enable(
                                not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }),
                                { bufnr = event.buf }
                            )
                            if vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }) then
                                vim.notify("Inlay hint is enabled.", nil)
                            else
                                vim.notify("Inlay hint is disabled.", nil)
                            end
                        end, "[T]oggle Inlay [H]ints")
                    end
                end,
            })

            local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
            local diagnostic_signs = {}

            for type, icon in pairs(signs) do
                diagnostic_signs[vim.diagnostic.severity[type]] = icon
            end
            vim.diagnostic.config({ signs = { text = diagnostic_signs } })
        end,
    },
}
