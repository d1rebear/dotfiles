vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.5",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use("vim-airline/vim-airline")
    use({
        "arcticicestudio/nord-vim",
        as = "nord",
        config = function()
            vim.cmd [[colorscheme nord]]
        end
    })
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-context")
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }
    use({
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    })
    use("ggandor/leap.nvim")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("junegunn/gv.vim")
    use("airblade/vim-gitgutter")
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            { "neovim/nvim-lspconfig" },
            {
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
        }
    }
    use("simrat39/rust-tools.nvim")
    use { 'smithbm2316/centerpad.nvim' }
end)
