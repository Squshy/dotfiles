require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>") -- Execute current file
vim.keymap.set("n", "<space>x", ":.lua<CR>") -- Execute current line
vim.keymap.set("v", "<space>x", ":lua<CR>") -- Select some lines, execute them
