local function on_attach(client, bufnr)
    -- see :help lsp-zero-keybindings
    require("lsp-zero").default_keymaps {
        buffer = bufnr,
        preserve_mappings = false
    }
    vim.keymap.set({ 'n', 'v' }, "<leader>f", vim.lsp.buf.format, { buffer = bufnr })
    vim.keymap.set('n', "gr", ":Telescope lsp_references<cr>", { buffer = bufnr })
    vim.keymap.set('n', "gi", ":Telescope lsp_implementations<cr>", { buffer = bufnr })

    require("lsp-inlayhints").on_attach(client, bufnr)
end

return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x", --TODO: migrate to v3.x
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            {
                "windwp/nvim-autopairs",
                event = "InsertEnter",
                opts = {} -- implicitly calls setup
            },
            -- Inlay hints
            { "lvimuser/lsp-inlayhints.nvim" },
            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.preset("recommended")
            lsp_zero.ensure_installed {
                "lua_ls", "eslint", "pyright", "sqlls",
                "taplo", "yamlls", "jsonls", "lemminx", "bashls", "clangd",
                "cmake", "dockerls", "docker_compose_language_service"
            }

            lsp_zero.configure("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        hint = {
                            enable = true
                        },
                        diagnostics = {
                            globals = { "vim" }
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false
                        },
                        telemetry = { enable = false }
                    }
                }
            })

            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local cmp_mappings = lsp_zero.defaults.cmp_mappings {
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select)
            }
            cmp_mappings["<Tab>"] = nil
            cmp_mappings["<S-Tab>"] = nil

            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

            lsp_zero.setup_nvim_cmp { mapping = cmp_mappings }

            lsp_zero.set_preferences {
                suggest_lsp_servers = false,
                sign_icons = {
                    error = 'E',
                    warn = 'W',
                    hint = 'H',
                    info = 'I'
                }
            }

            require("lsp-inlayhints").setup()

            lsp_zero.on_attach(on_attach)
            lsp_zero.setup()

            vim.diagnostic.config { virtual_text = true }
        end
    },
    -- Rust deserves some extra love
    {
        "mrcjkb/rustaceanvim",
        lazy = false,
        version = "^4",
        dependencies = { "VonHeikemen/lsp-zero.nvim" },
        ft = { "rust" },
        config = function()
            vim.g.rustaceanvim = function()
                -- local mason_registry = require("mason-registry")
                -- local codelldb = mason_registry.get_package("codelldb")
                -- local extension_path = codelldb:get_install_path() .. "/extension/"
                -- local codelldb_path = extension_path .. "adapter/codelldb"
                -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
                -- local cfg = require("rustaceanvim.config")

                return {
                    server = {
                        on_attach = function(client, bufnr)
                            on_attach(client, bufnr)
                            vim.keymap.set('n', "em", ":RustLsp expandMacro<cr>", { buffer = bufnr })
                        end
                    },
                    tools = {
                        hover_actions = {
                            auto_focus = true
                        }
                    },
                    -- dap = {
                    --     adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path)
                    -- }
                }
            end
        end
    }
}
