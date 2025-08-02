local M = {}

function M.setup()
	require("aider").setup {
		after_update_hook = function()
			require("diffview").open({ "HEAD^" })
		end,
	}

	local vim = vim
	local keymap = vim.api.nvim_set_keymap

	keymap("n", "<leader>aa", "<cmd>AiderSpawn<CR>", { desc = "Toggle Aider (default)", noremap = true, silent = true })
	keymap("n", "<leader>x", "<cmd>AiderToggle<CR>", { desc = "Toggle Aider", noremap = true, silent = true })
	-- keymap("n", "<leader>af", "<cmd>AiderToggle float<CR>", { desc = "Toggle Aider Float", noremap = true, silent = true })
	-- keymap("n", "<leader>av", "<cmd>AiderToggle vertical<CR>",
	-- { desc = "Toggle Aider Float", noremap = true, silent = true })
	keymap("n", "<leader>ad", "<cmd>AiderAdd<CR>", { desc = "Add file to aider", noremap = true, silent = true })
	keymap("v", "<leader>as", "<cmd>AiderAsk<CR>", { desc = "Ask with selection", noremap = true, silent = true })
	keymap("n", "<leader>as", "<cmd>AiderAsk<CR>", { desc = "Ask with selection", noremap = true, silent = true })

	keymap("i", "<C-x>", "<cmd>AiderToggle<CR>", { noremap = true, silent = true })
	keymap("t", "<C-x>", "<cmd>AiderToggle<CR>", { noremap = true, silent = true })
	keymap("n", "<C-x>", "<cmd>AiderToggle<CR>", { noremap = true, silent = true })

	keymap("n", "<leader>ghh", "<cmd>Gitsigns change_base HEAD^<CR>", { noremap = true, silent = true })
	keymap("n", "<leader>dvh", "<cmd>DiffviewOpen HEAD^<CR>", { noremap = true, silent = true })
	keymap("n", "<leader>dvo", "<cmd>DiffviewOpen<CR>", { noremap = true, silent = true })
	keymap("n", "<leader>dvc", "<cmd>DiffviewClose!<CR>", { noremap = true, silent = true })
end

return M
