local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('folke/tokyonight.nvim')
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })
Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
Plug('junegunn/fzf', {
	['do'] = function()
		vim.fn['fzf#install']()
	end
})
Plug('tpope/vim-fireplace', { ['for'] = 'clojure' })
Plug('ervandew/supertab')
Plug('windwp/nvim-autopairs')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('numToStr/Comment.nvim')
Plug('wakatime/vim-wakatime')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('ThePrimeagen/vim-be-good')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
Plug('lewis6991/gitsigns.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('Exafunction/windsurf.nvim')
vim.call('plug#end')

vim.cmd('silent! colorscheme tokyonight')

vim.o.wrap = false
vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.MyTabLine()"

vim.g.netrw_liststyle = 4
vim.g.netrw_banner = 0
vim.g.prettier = 1
vim.g.netrw_winsize = 25 -- percentage

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.cmd("vertical resize 30") -- fixed width
	end,
})


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

require 'keys.bindings'.setup()
require 'keys.opts'
require 'plugins.main'
