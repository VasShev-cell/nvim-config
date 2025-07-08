local vim = vim
local opt = vim.opt

opt.shiftwidth = 2
opt.tabstop = 2
opt.compatible = false
opt.smartindent = true
opt.relativenumber = true
opt.mouse = ""


vim.o.wrap = false
vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.MyTabLine()"

vim.g.netrw_liststyle = 4
vim.g.netrw_banner = 0
vim.g.prettier = 1

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
require("config.lazy")


vim.cmd('silent! colorscheme tokyonight')

