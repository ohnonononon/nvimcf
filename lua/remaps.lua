local utils = require("utils")
-- replace all instances of word hovered by cursor
vim.keymap.set("n", "<leader>rk", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Navigation
vim.keymap.set("n", "<leader>k", "<cmd>bnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>bprev<CR>zz")
vim.keymap.set("n", "<leader>l", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>h", "<cmd>cprev<CR>zz")

-- Buffer interaction
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>x", "<cmd>b#<bar>bd#<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>cp", utils.CloseNFocus, { desc = "Close pane" })

-- Syntax and format
vim.keymap.set("n", "<leader>=", "gg=G<C-o>zz")
vim.keymap.set("n", "<leader>tf", utils.toggle_focus)
vim.keymap.set("n", "<leader>norm", "<cmd>!norminette > log<CR>")

-- NVIM sys interaction
vim.keymap.set("n", "<leader>pv", "<cmd>Explore<CR>")
vim.keymap.set("n", "<leader>exsh", "<cmd>.!sh<CR>")
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- TERMINAL pane manipulation
vim.keymap.set("n", "<leader>to", utils.open_term, { desc = "[T]erminal [O]pen. If open, Focus." })
vim.keymap.set("n", "<leader>tp", utils.close_term_pane, { desc = "Terminal: Toggle Pane" })
vim.keymap.set("t", "<leader>tp", utils.close_term_finside, { desc = "Exit terminal insert mode and close pane" })
vim.keymap.set("t", "<C-c><C-c>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- vim.keymap.set("t", "<C-c>", "<C-\\><C-N>")
-- vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-h>")
-- vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-l>")
-- vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-j>")
-- vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-k>")

--- PANE manipulation
vim.keymap.set("n", "<leader>-", ":resize 8<CR>", { desc = "Resize to small" })
vim.keymap.set("n", "<leader>+", ":resize 24<CR>", { desc = "Resize to mid" })
vim.keymap.set("n", "<leader>^", ":resize 48<CR>", { desc = "Resize to big" })
