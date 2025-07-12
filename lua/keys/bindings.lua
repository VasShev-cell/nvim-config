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
	map('n', '<leader>e', ':Explore<Enter>', opts)

	map('n', '<leader>-', ':split<Enter>', opts)
	map('n', '<leader>|', ':vsplit<Enter>', opts)

	map('n', '<leader>h', ':noh<Enter>', opts)

	map('n', '<tab><tab>', ':tabn<CR>', opts)
	map('n', '<S-tab><S-tab>', ':tabp<CR>', opts)
	map('n', '<tab>t', ':tabnew<CR>:Explore<CR>', opts)

	map('n', '<leader>co', ':copen<CR>', opts)
	map('n', '<leader>cn', ':cn<CR>', opts)
	map('n', '<leader>cp', ':cp<CR>', opts)
	map('n', '<leader>cf', ':caddfile %<CR>', opts)

	map('i', 'jj', '<Esc>', opts)
end

return M
