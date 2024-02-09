return {
    {
        "ggandor/leap.nvim", -- the best plugin ever,
        dependencies = {
            "tpope/vim-repeat"
        },
        config = function()
            require("leap").create_default_mappings()
        end
    }
}
