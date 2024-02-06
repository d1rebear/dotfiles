local function config()
    vim.keymap.set("n", "<leader>gl", "<cmd>diffget //2<CR>")
    vim.keymap.set("n", "<leader>gr", "<cmd>diffget //3<CR>")
end

return {
    config = config
}
