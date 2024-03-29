--TODO: support lowercase comment annotations (todo, fixme, etc.)
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup {
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = {
                    "comment", "bash", "make", "cmake", "c", "cpp", "lua",
                    "rust", "java", "python", "scala", "json", "yaml",
                    "toml", "dockerfile", "sql", "markdown", "markdown_inline"
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false
                },

                indent = { enabled = true }
            }

            -- folding
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
            vim.opt.foldenable = false -- autofold on buffer open
        end
    },
    --TODO: highlighting
    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = false,
        config = function()
            vim.cmd("hi TreesitterContextBottom gui=underline guisp=Grey")
            vim.cmd("hi TreesitterContextLineNumberBottom gui=underline guisp=Grey")
        end,
        keys = {
            { "<leader>gc", function() require("treesitter-context").go_to_context(vim.v.count1) end }
        }
    }
}
