return {
    {
        "ThePrimeagen/harpoon",
        lazy = true,
        branch = "harpoon2",
        dependencies = {
            { "nvim-lua/plenary.nvim" }
        },
        config = function()
            require("harpoon"):setup()
        end,
        keys = {
            { "<leader>A", function() require("harpoon"):list():append() end,
            desc = "harpoon file" },
            { "<leader>a", function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end, desc = "toggle harpoon list" },
            { "<leader>1", function() require("harpoon"):list():select(1) end,
            desc = "show harpoon #1" },
            { "<leader>2", function() require("harpoon"):list():select(2) end,
            desc = "show harpoon #2" },
            { "<leader>3", function() require("harpoon"):list():select(3) end,
            desc = "show harpoon #3" },
            { "<leader>4", function() require("harpoon"):list():select(4) end,
            desc = "show harpoon #4" },
            { "<leader>5", function() require("harpoon"):list():select(5) end,
            desc = "show harpoon #5" }
        }
    }
}
