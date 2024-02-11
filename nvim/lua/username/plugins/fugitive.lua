return {
    {
        "tpope/vim-fugitive",
        lazy = false,
        keys = {
            { "<leader>gl", ":diffget //2<cr>", desc = "diff: get left" },
            { "<leader>gr", ":diffget //3<cr>", desc = "diff: get right" }
        }
    }
}
