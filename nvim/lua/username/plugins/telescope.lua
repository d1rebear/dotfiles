local function get_visual_selection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg("v")
    vim.fn.setreg("v", {})
    text = string.gsub(text, "\n", "")
    return #text > 0 and text or ""
end

return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        lazy = true,
        build = "make"
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        version = "0.1.5",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim" }
        },
        config = function()
            local trouble = require("trouble.providers.telescope")
            require("telescope").setup {
                defaults = {
                    path_display = {
                        "smart",
                        truncate = 1
                    },
                    mappings = {
                        i = { ["<leader>xo"] = trouble.open_with_trouble },
                        n = { ["<leader>xo"] = trouble.open_with_trouble },
                    }
                }
            }
        end,
        keys = {
            { "<C-p>", function() require("telescope.builtin").git_files() end, desc = "git files" },
            { "<leader>pf", function() require("telescope.builtin").find_files() end, desc = "find files" },
            { "<leader>pf", function()
                require("telescope.builtin").find_files({ default_text = get_visual_selection() })
            end, mode = 'v', desc = "find files from selection" },
            { "<leader>ps", function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("grep > ") })
            end, desc = "grep" },
            { "<leader>ps", function()
                require("telescope.builtin").grep_string({ default_text = get_visual_selection() })
            end, mode = 'v', desc = "grep selection" }
        }
    }
}
