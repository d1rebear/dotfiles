local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })

    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = true })

    --TODO: more bindings :help lsp-zero-keybindings
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "lua_ls",
        "rust_analyzer",
        "eslint"
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = {
                        globals = {
                            "vim", "OML", "uuid"
                        }
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false
                    },
                    telemetry = { enable = false }
                }
            }
        end
    }
})

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

lsp_zero.setup_servers({ "lua_ls", "rust_analyzer", "eslint" })
