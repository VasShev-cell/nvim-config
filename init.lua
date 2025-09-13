function _G.MyTabLine()
	local s = ''
	for i = 1, vim.fn.tabpagenr('$') do
		local winnr = vim.fn.tabpagewinnr(i)
		local buflist = vim.fn.tabpagebuflist(i)
		local bufnr = buflist[winnr]
		local name = vim.fn.bufname(bufnr)
		local filename = name ~= '' and vim.fn.fnamemodify(name, ':t') or '[No Name]'
		local hl = (i == vim.fn.tabpagenr()) and '%#TabLineSel#' or '%#TabLine#'
		s = s .. hl .. ' ' .. i .. ': ' .. filename .. ' '
	end
	s = s .. '%#TabLineFill#'
	return s
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', '<leader>w', ':update<CR>')
vim.keymap.set('n', '<leader>h', ':noh<CR>')
vim.keymap.set('n', '<leader>-', ':split<CR>')
vim.keymap.set('n', '<leader>|', ':vsplit<CR>')
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.compatible = false
vim.o.smartindent = true
vim.o.relativenumber = true
vim.o.clipboard = 'unnamedplus'
vim.o.mouse = ""
vim.o.wrap = false
vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.MyTabLine()"
vim.o.swapfile = false
vim.g.netrw_liststyle = 4
vim.g.netrw_banner = 0
vim.g.prettier = 1
vim.g.netrw_winsize = 25
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', 'р', ':norm h<CR>', { silent = true })
vim.keymap.set('n', 'о', ':norm j<CR>', { silent = true })
vim.keymap.set('n', 'л', ':norm k<CR>', { silent = true })
vim.keymap.set('n', 'д', ':norm l<CR>', { silent = true })
vim.keymap.set('n', 'щ', ':norm o<CR>', { silent = true })
vim.keymap.set('n', 'Щ', ':norm O<CR>', { silent = true })
vim.keymap.set('n', 'Щ', ':norm O<CR>', { silent = true })
vim.keymap.set('n', '<C-з>', ':norm <C-p><CR>', { silent = true })
vim.keymap.set('n', '<C-З>', ':norm <C-P><CR>', { silent = true })
vim.keymap.set('v', 'р', '<Left>')
vim.keymap.set('v', 'о', '<Down>')
vim.keymap.set('v', 'л', '<Up>')
vim.keymap.set('v', 'д', '<Right>')

vim.keymap.set('n', 'ф', 'a')
vim.keymap.set('n', 'Ф', 'A')
vim.keymap.set('n', 'ш', 'i')
vim.keymap.set('n', 'Ш', 'I')
vim.keymap.set('n', 'ц', ':norm w<CR>', { silent = true })
vim.keymap.set('n', 'у', ':norm e<CR>', { silent = true })
vim.keymap.set('n', 'и', ':norm b<CR>', { silent = true })
vim.keymap.set('n', 'м', ':norm v<CR>', { silent = true })
vim.keymap.set('n', 'М', ':norm <S-V><CR>', { silent = true })

vim.keymap.set('n', '<leader>w', ':update<CR>')
vim.keymap.set('n', '<leader>ц', ':update<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>й', ':q<CR>')

vim.keymap.set('n', '<leader>-', ':split<CR>')
vim.keymap.set('n', '<leader>|', ':vsplit<CR>')
vim.keymap.set('n', '<leader>/', ':vsplit<CR>')
vim.keymap.set('n', '<leader>h', ':noh<CR>')
vim.keymap.set('n', '<leader>р', ':noh<CR>')
vim.keymap.set('n', '<tab><tab>', ':tabn<CR>')
vim.keymap.set('n', '<S-tab><S-tab>', ':tabp<CR>')
vim.keymap.set('n', '<tab>t', ':tabnew<CR>:Oil<CR>')
vim.keymap.set('n', '<tab>е', ':tabnew<CR>:Oil<CR>')
vim.keymap.set('n', '<leader>co', ':copen<CR>')
vim.keymap.set('n', '<leader>cn', ':cn<CR>')
vim.keymap.set('n', '<leader>cp', ':cp<CR>')
vim.keymap.set('n', '<leader>cc', ':cclose<CR>')
vim.keymap.set('n', '<leader>cf', ':caddfile %<CR>')

vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neoclide/coc.nvim" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/Exafunction/windsurf.nvim" },
	{ src = "https://github.com/aweis89/aider.nvim" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/wakatime/vim-wakatime" },
	{ src = "https://github.com/folke/tokyonight.nvim" },

})

vim.cmd [[colorscheme tokyonight]]

-- telescope setup
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- oil keymaps
require('oil').setup({
	delete_to_trash = true,
	view_options = {
		show_hidden = true
	}
})
vim.keymap.set('n', '<leader>e', ':Oil<CR>')

require('plugins.main')
