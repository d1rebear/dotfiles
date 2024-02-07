return {
    "christoomey/vim-tmux-navigator",
    "junegunn/gv.vim",
    "airblade/vim-gitgutter",
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup { icons = false }
        end
    },
    "smithbm2316/centerpad.nvim",
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    }
}
