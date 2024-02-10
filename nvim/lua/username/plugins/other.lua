return {
    {
        "christoomey/vim-tmux-navigator",
        config = function()
            vim.g.tmux_navigator_disable_when_zoomed = 1
            vim.g.tmux_navigator_no_wrap = 1
        end
    },
    "junegunn/gv.vim",
    "airblade/vim-gitgutter",
    "smithbm2316/centerpad.nvim",
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- implicitly calls setup
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    }
}
