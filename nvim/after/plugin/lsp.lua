local lsp = require("lsp-zero").preset({})

lsp.ensure_installed({
    "bashls",
    "lua_ls",
    "rust_analyzer"
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = true })
end)

lsp.format_mapping("gq", {
    format_opts = {
        async = false,
        timeout_ms = 10000
    },
    servers = {
        ["lua_ls"] = { "lua" },
        ["rust_analyzer"] = { "rust" }
    }
})

require("lspconfig").lua_ls.setup {
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
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "sh",
    callback = function()
        vim.lsp.start({
            name = "bash-language-server",
            cmd = { "bash-language-server", "start" },
        })
    end,
})

lsp.setup()
