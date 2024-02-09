return {
    {
        "tpope/vim-surround",
        dependencies = {
            "tpope/vim-repeat"
        },
        keys = {
            --TODO: more mappings?
            { "<leader>wa", "<Plug>Yssurround", desc = "add surround" },
            { "<leader>wc", "<Plug>Csurround", desc = "change surround" },
            { "<leader>wd", "<Plug>Dsurround", desc = "remove surround" },
        }
    }
}
