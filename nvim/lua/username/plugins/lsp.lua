return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
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
            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.preset("recommended")
            lsp_zero.ensure_installed {
                "rust_analyzer",
                "lua_ls",
                "eslint",
                "pyright",
                "sqlls",
                "taplo",
                "yamlls",
                "jsonls",
                "lemminx",
                "bashls",
                "clangd",
                "cmake",
                "dockerls",
                "docker_compose_language_service"
            }

            lsp_zero.configure("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
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

            lsp_zero.on_attach(function(_, bufnr)
                -- see :help lsp-zero-keybindings
                lsp_zero.default_keymaps {
                    buffer = bufnr,
                    preserve_mappings = false
                }
                vim.keymap.set('n', "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
            end)

            lsp_zero.format_mapping("<leader>f", {
                format_opts = {
                    async = false,
                    timeout_ms = 10000
                },
                servers = {
                    ["lua_ls"] = { "lua" },
                    ["rust_analyzer"] = { "rust" },
                    ["eslint"] = { "javascript" }
                }
            })

            lsp_zero.setup()

            vim.diagnostic.config { virtual_text = true }
        end
    }
}
