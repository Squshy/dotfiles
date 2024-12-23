require("config.lazy")

local opt = vim.opt
opt.shiftwidth = 4
opt.number = true
opt.relativenumber = true

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>") -- Execute current file
vim.keymap.set("n", "<space>x", ":.lua<CR>") -- Execute current line
vim.keymap.set("v", "<space>x", ":lua<CR>") -- Select some lines, execute them
