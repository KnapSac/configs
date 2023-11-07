if vim.g.did_load_filetypes then
    return
end

vim.api.nvim_create_augroup('filetypedetect', { clear = false })

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    group = 'filetypedetect',
    callback = function(args)
        if not vim.api.nvim_buf_is_valid(args.buf) then
            return
        end

        local ft = nil
        if string.find(args.match, 'Directory.Build') then
            ft = 'xml'
        end
        if string.find(args.match, '.config') then
            ft = 'config'
        end

        if ft ~= nil then
            vim.api.nvim_buf_call(args.buf, function()
                vim.api.nvim_cmd({ cmd = 'setf', args = { ft } }, {})
            end)
            vim.g.did_load_filetypes = 1
        end
    end
})
