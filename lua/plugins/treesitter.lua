local M = {}
function M.setup()
	require 'nvim-treesitter.configs'.setup {
		highlight = { enable = true },
		ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline", 'typescript', 'javascript', 'tsx', 'json', 'python' },
		sync_install = false,
		auto_install = true
	}
end

return M
