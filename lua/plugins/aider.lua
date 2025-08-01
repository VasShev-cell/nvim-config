-- Aider plugin configuration
local M = {}

-- Setup function for Aider plugin
function M.setup()
	-- Configure Aider plugin
	require("aider").setup({
		-- Hook to run after Aider is updated
		after_update_hook = function()
			-- Open Diffview with previous commit
			require("diffview").open({ "HEAD^" })
		end,
	})

	-- Get the vim object
	local vim = vim
	-- Set keymaps using vim.api.nvim_set_keymap
	local keymap = vim.api.nvim_set_keymap

	-- Set keymaps for normal mode
	keymap("n", "<leader>aa", "<cmd>AiderSpawn<CR>", { desc = "Toggle Aider (default)", noremap = true, silent = true })
	keymap("n", "<leader>x", "<cmd>AiderToggle<CR>", { desc = "Toggle Aider", noremap = true, silent = true })
	keymap("n", "<leader>af", "<cmd>AiderToggle float<CR>", { desc = "Toggle Aider Float", noremap = true, silent = true })
	keymap("n", "<leader>av", "<cmd>AiderToggle vertical<CR>",
		{ desc = "Toggle Aider Float", noremap = true, silent = true })
	keymap("n", "<leader>al", "<cmd>AiderAdd<CR>", { desc = "Add file to aider", noremap = true, silent = true })
	keymap("v", "<leader>ad", "<cmd>AiderAsk<CR>", { desc = "Ask with selection", noremap = true, silent = true })
	keymap("n", "<leader>ad", "<cmd>AiderAsk<CR>", { desc = "Ask with selection", noremap = true, silent = true })

	-- Set keymaps for insert mode
	keymap("i", "<C-x>", "<cmd>AiderToggle<CR>", { noremap = true, silent = true })

	-- Set keymaps for terminal mode
	keymap("t", "<C-x>", "<cmd>AiderToggle<CR>", { noremap = true, silent = true })

	-- Set keymaps for normal mode
	keymap("n", "<C-x>", "<cmd>AiderToggle<CR>", { noremap = true, silent = true })

	-- Set keymaps for normal mode
	keymap("n", "<leader>ghh", "<cmd>Gitsigns change_base HEAD^<CR>", { noremap = true, silent = true })
	keymap("n", "<leader>dvh", "<cmd>DiffviewOpen HEAD^<CR>", { noremap = true, silent = true })
	keymap("n", "<leader>dvo", "<cmd>DiffviewOpen<CR>", { noremap = true, silent = true })
	keymap("n", "<leader>dvc", "<cmd>DiffviewClose!<CR>", { noremap = true, silent = true })
end

-- Return the M table
return M
