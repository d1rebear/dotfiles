local function config()
    require("rose-pine").setup({
        variant = "main",
        dim_inactive_windows = true,
        groups = {
            panel = "base"
        }
    })
    vim.cmd("colorscheme rose-pine")
end

return {
    config = config
}
