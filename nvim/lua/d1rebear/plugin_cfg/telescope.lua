local function get_visual_selection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg("v")
    vim.fn.setreg("v", {})
    text = string.gsub(text, "\n", "")
    return #text > 0 and text or ""
end

local function config()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('v', '<leader>pf', function()
        builtin.find_files({ default_text = get_visual_selection() })
    end)
    vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("grep > ") })
    end)
    vim.keymap.set('v', '<leader>ps', function()
        builtin.grep_string({ default_text = get_visual_selection() })
    end)
    require('telescope').setup {
        defaults = {
            path_display = { "smart" }
        }
    }
end

return {
    config = config
}
