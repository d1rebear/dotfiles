return {
    {
        "christoomey/vim-tmux-navigator",
        config = function()
            vim.g.tmux_navigator_disable_when_zoomed = 1
            vim.g.tmux_navigator_no_wrap = 1
        end
    },
    {
        "junegunn/gv.vim",
        dependencies = { "tpope/vim-fugitive" }
    },
    "airblade/vim-gitgutter",
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        lazy = true,
        config = function()
            require("colorizer").setup()
        end,
        keys = {
            { "<leader>col", ":ColorizerAttachToBuffer<cr>", desc = "colorizer attach" },
            { "<leader>ct", ":ColorizerToggle<cr>", desc = "colorizer toggle" }
        }
    }
}
