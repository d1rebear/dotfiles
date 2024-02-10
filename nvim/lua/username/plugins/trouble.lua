return {
    {
        "folke/trouble.nvim",
        lazy = true,
        config = function()
            require("trouble").setup {
                icons = false,
                use_diagnostic_signs = true
            }
        end,
        keys = {
            { "<leader>xx", function() require("trouble").toggle() end }
        }
    }
}
