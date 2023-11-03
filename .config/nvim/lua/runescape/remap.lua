vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, { buffer = 0 })
vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, { buffer = 0 })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/runescape/packer.lua<CR>");

-- Map in normal mode, when clicked K, the hover only in this buffer
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
-- Go to definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
-- Go to type definition
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
-- Go to implementation
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
-- Diagnostic list
vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<CR>", { buffer = 0 })
-- References list
vim.keymap.set('n', '<leader>dr', "<cmd>Telescope lsp_references<CR>", { buffer = 0 })
-- Rename a variable and fix the places we change the name
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = 0 })
