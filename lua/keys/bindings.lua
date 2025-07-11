local M = {}

function M.setup()
	local vim = vim
	local g = vim.g
	local map = vim.api.nvim_set_keymap
	local opts = { noremap = true }

	g.mapleader = " "
	g.maplocalleader = " "

	vim.cmd("autocmd FileType scss setl iskeyword+=@-@")

	map('n', '<leader>w', ':update<Enter>', opts)
	map('n', '<leader>q', ':q<Enter>', opts)
	map('n', '<leader>e', ':Lexplore<Enter>', opts)

	map('n', '<leader>-', ':split<Enter>', opts)
	map('n', '<leader>|', ':vsplit<Enter>', opts)

	map('n', '<leader>h', ':noh<Enter>', opts)

	map('n', '<tab><tab>', ':tabn<CR>', opts)
	map('n', '<S-tab><S-tab>', ':tabp<CR>', opts)
	map('n', '<tab>t', ':tabnew<CR>:Ex<CR>', opts)

	map('n', '<leader>co', ':copen<CR>', opts)
	map('n', '<leader>cn', ':cn<CR>', opts)
	map('n', '<leader>cp', ':cp<CR>', opts)
	map('n', '<leader>cf', ':caddfile %<CR>', opts)

	map('i', 'jj', '<Esc>', opts)

	vim.keymap.set('n', '<leader>n', function()
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			local buf = vim.api.nvim_win_get_buf(win)
			local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
			if ft == 'netrw' then
				vim.api.nvim_set_current_win(win)
				return
			end
		end
		print("netrw not open")
	end, { desc = "Jump to netrw window if open" })
end

return M
