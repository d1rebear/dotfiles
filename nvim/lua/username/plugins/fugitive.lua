return {
    {
        "tpope/vim-fugitive",
        lazy = true,
        keys = {
            { "<leader>gs", vim.cmd.Git, desc = "fugitive" },
            { "<leader>gl", ":diffget //2<cr>", desc = "diff: get left" },
            { "<leader>gr", ":diffget //3<cr>", desc = "diff: get right" }
        }
    }
}
