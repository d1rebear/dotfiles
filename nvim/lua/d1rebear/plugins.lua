return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = require("d1rebear.plugin_cfg.rose-pine").config
    },
    "christoomey/vim-tmux-navigator",
    {
        "tpope/vim-fugitive",
        lazy = false,
        keys = {
           { "<leader>gl", "<cmd>diffget //2<CR>", desc = "diff: get left" },
           { "<leader>gr", "<cmd>diffget //3<CR>", desc = "diff: get right" }
        }
    },
    "junegunn/gv.vim",
    "airblade/vim-gitgutter",
    {
        "mbbill/undotree",
        lazy = false,
        keys = {
           { "<leader>u", vim.cmd.UndotreeToggle, desc = "toggle undotree" }
        }
    },
    {
        "ggandor/leap.nvim", -- the best plugin ever
        config = function()
            require("leap").create_default_mappings()
        end
    },
    {
        "tpope/vim-surround",
        lazy = false,
        keys = {
            --TODO: more mappings?
            { "<leader>wa", "<Plug>Yssurround", desc = "add surround" },
            { "<leader>wc", "<Plug>Csurround", desc = "change surround" },
            { "<leader>wd", "<Plug>Dsurround", desc = "remove surround" },
        }
    },
    "nvim-lua/plenary.nvim",
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.5",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = require("d1rebear.plugin_cfg.telescope").config
    },
    --TODO: support lowercase comment annotations (todo, fixme, etc.)
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = require("d1rebear.plugin_cfg.treesitter").config
    },
    "nvim-treesitter/nvim-treesitter-context",
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    "smithbm2316/centerpad.nvim",
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },
    --FIXME: has conflicts with some other plugin above
    -- {
    --     "ThePrimeagen/harpoon",
    --     version = "harpoon2",
    --     dependencies = {
    --         { "nvim-lua/plenary.nvim" }
    --     },
    --     config = function()
    --         require("harpoon"):setup()
    --         --TODO: keys
    --     end
    -- }

    -- TODO: LSP + bash, rust, lua, yaml, json, toml, C, C++ + code actions
    -- TODO: DAP + ui  + rust + keymaps

    {

    }
}
