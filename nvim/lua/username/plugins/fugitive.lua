return {
    {
        "tpope/vim-fugitive",
        lazy = false,
        keys = {
            { "<leader>gs", vim.cmd.Git, desc = "fugitive" },
            { "<leader>gl", "<cmd>diffget //2<CR>", desc = "diff: get left" },
            { "<leader>gr", "<cmd>diffget //3<CR>", desc = "diff: get right" }
        }
    }
}
