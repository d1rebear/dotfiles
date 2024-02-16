--TODO: DAP + ui + rust + keymaps
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = { "mrcjkb/rustaceanvim" },
        config = function()
            local dap = require("dap")
            local mason_registry = require("mason-registry")
            local codelldb = mason_registry.get_package("codelldb")
            local extension_path = codelldb:get_install_path() .. "/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
            local port = "13000"

            dap.adapters.codelldb = {
                type = "server",
                port = port,
                executable = {
                    command = codelldb_path,
                    args = {
                        "--liblldb", liblldb_path,
                        "--port", port
                    }
                }
            }
            dap.configurations.rust = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', "file")
                    end,
                    cwd = "${workspaceFolder}",
                    showDisassembly = "never",
                },
                {
                    name = "Attach to process",
                    type = "codelldb",
                    request = "attach",
                    pid = require("dap.utils").pick_process,
                    args = {},
                    -- cwd = "${workspaceFolder}",
                    showDisassembly = "never"
                }
            }
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("dapui").setup()
        end
    }
}
