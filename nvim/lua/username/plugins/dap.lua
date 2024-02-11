--TODO: DAP + ui + rust + keymaps
return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local port = "13000"
            dap.adapters.codelldb = {
                type = "server",
                port = port,
                executable = {
                    command = "/home/pmolchanov/tools/codelldb/extension/adapter/codelldb",
                    args = { "--port", port }
                }
            }
            dap.configurations.rust = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    showDisassembly = "never"
                },
                {
                    name = "Attach to process",
                    type = "codelldb",
                    request = "attach",
                    pid = require("dap.utils").pick_process,
                    args = {},
                    stopOnEntry = false,
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
