require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.numberwidth = 4
-- LSP and stuff like to throw things here, keep it always active to not have
-- jitter
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"


vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>") -- Execute current file
vim.keymap.set("n", "<space>x", ":.lua<CR>")                -- Execute current line
vim.keymap.set("v", "<space>x", ":lua<CR>")                 -- Select some lines, execute them
