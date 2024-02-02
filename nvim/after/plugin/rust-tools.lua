require("rust-tools").setup({
    server = {
        settings = {
            ["rust-analyzer"] = {
                procMacro = {
                    enable = true
                },
                diagnostics = {
                    disabled = {
                        "unresolved-proc-macro"
                    }
                }
            }
        }
    }
})
