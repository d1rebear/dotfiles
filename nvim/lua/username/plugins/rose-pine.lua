return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "main",
                dim_inactive_windows = true,
                groups = {
                    panel = "base"
                }
            })
            vim.cmd("colorscheme rose-pine")
        end
    }
}
