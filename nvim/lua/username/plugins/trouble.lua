return {
    {
        "folke/trouble.nvim",
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
