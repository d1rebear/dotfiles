vim.g.mapleader = " "
vim.keymap.set("n", "<Esc>", ":noh<CR>", { noremap = false })
vim.keymap.set("n", "<leader>t", vim.cmd.Ex)

--NOTE: avoid conflicts between netrw and vim-tmux-navigator
vim.keymap.set("n", "<C-t>", "<Plug>NetrwRefresh", {
    silent = true,
    nowait = true,
})

-- move line(s) up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append next line to the end of the current
vim.keymap.set("n", "J", "mzJ`z")

-- auto vertical centering
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste, yank, delete without changing register
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- replace all occurences in current buffer (does it's work in somewhat stupid way)
--TODO: same for visual mode (just adding mode here is not enough)
vim.keymap.set({ "n" }, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
