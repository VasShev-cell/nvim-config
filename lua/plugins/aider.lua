local M = {}

function M.setup()
	require("aider").setup {
		auto_show = {
			on_ask = true,     -- e.x. `ai? comment`
			on_change_req = true, -- e.x. `ai! comment`
			on_file_add = true, -- e.x. when using Telescope or `AiderLoad` to add files
		},
		spawn_on_comment = true,
		watch_files = true,
		auto_insert = true,
		after_update_hook = function()
			require("diffview").open({ "HEAD^" })
		end,
	}

	local vim = vim
	local keymap = vim.api.nvim_set_keymap

	-- keymap("n", "<leader>a<space>", "<cmd>AiderSpawn<CR>",
	-- 	{ desc = "Toggle Aider (default)", noremap = true, silent = true })
	keymap("n", "<leader>u", "<cmd>AiderToggle<CR>", { desc = "Toggle Aider", noremap = true, silent = true })
	-- keymap("n", "<leader>af", "<cmd>AiderToggle float<CR>", { desc = "Toggle Aider Float", noremap = true, silent = true })
	-- keymap("n", "<leader>av", "<cmd>AiderToggle vertical<CR>",
	-- { desc = "Toggle Aider Float", noremap = true, silent = true })
	keymap("n", "<leader>ad", "<cmd>AiderAdd<CR>", { desc = "Add file to aider", noremap = true, silent = true })
	keymap("v", "<leader>au", "<cmd>AiderAsk<CR>", { desc = "Ask with selection", noremap = true, silent = true })
	keymap("n", "<leader>au", "<cmd>AiderAsk<CR>", { desc = "Ask with selection", noremap = true, silent = true })

	keymap("i", "<C-u>", "<cmd>AiderToggle<CR>", { noremap = true, silent = true })
	keymap("t", "<C-u>", "<cmd>AiderToggle<CR>", { noremap = true, silent = true })
	keymap("n", "<C-u>", "<cmd>AiderToggle<CR>", { noremap = true, silent = true })

	keymap("n", "<leader>ghh", "<cmd>Gitsigns change_base HEAD^<CR>", { noremap = true, silent = true })
	keymap("n", "<leader>dvh", "<cmd>DiffviewOpen HEAD^<CR>", { noremap = true, silent = true })
	keymap("n", "<leader>dvo", "<cmd>DiffviewOpen<CR>", { noremap = true, silent = true })
	keymap("n", "<leader>dvc", "<cmd>DiffviewClose!<CR>", { noremap = true, silent = true })
end

return M
