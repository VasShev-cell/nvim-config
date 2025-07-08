vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('go', { clear = true }),
    pattern = { 'go' },
    callback = function(args)
        vim.b[args.buf].autoimport = true
    end,
})
