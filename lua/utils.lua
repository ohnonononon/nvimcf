local M = {}

-- Close the current pane and go into the last used one.
function M.CloseNFocus()
	vim.cmd.close()
	vim.cmd("wincmd p")
end

-- Center the cursor line
local focus_state = "off"
function M.toggle_focus()
	if focus_state == "off" then
		vim.keymap.set("n", "k", "kzz")
		vim.keymap.set("n", "j", "jzz")
		vim.keymap.set("n", "<C-d>", "<C-d>zz")
		vim.keymap.set("n", "<C-u>", "<C-u>zz")
		focus_state = "on"
	else
		vim.keymap.set("n", "k", "k")
		vim.keymap.set("n", "j", "j")
		focus_state = "off"
	end
end

-- C/C++ compile and execute
function M.compile()
	vim.cmd.make()
end

function M.exc()
	local tab = vim.fn.getcompletion(":!./", "cmdline")
	local first = tab[1]
	if first then
		vim.cmd("!" .. first)
	else
		print(tab[1])
	end
end

-- TERMINAL PANE MANIPULATION
function M.close_term_pane()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf] and vim.bo[buf].buftype == "terminal" then
			vim.api.nvim_set_current_win(win)
			M.CloseNFocus()
			return
		end
	end
end

function M.open_term()
	if vim.bo.buftype == "terminal" then
		M.CloseNFocus()
		return
	end
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf] and vim.bo[buf].buftype == "terminal" then
			vim.api.nvim_set_current_win(win)
			vim.cmd("startinsert")
			return
		end
	end
	vim.cmd.split()
	vim.cmd.resize(8)
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].buftype == "terminal" then
			vim.cmd.buffer(buf)
			return
		end
	end
	vim.cmd.term()
	vim.cmd("startinsert")
end

function M.close_term_finside()
	vim.cmd("stopinsert")
	M.close_term_pane()
end

return M
