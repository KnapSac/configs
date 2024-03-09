-- Use both numbers and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Colorscheme
vim.g.gruvbox_contrast_dark = 'hard'
vim.opt.background = 'dark'
vim.cmd.colorscheme('gruvbox')

-- General
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.errorbells = false
vim.opt.textwidth = 100
vim.opt.scrolloff = 8
vim.opt.fixendofline = false

-- Search
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.json,*.ts,*.tsx,*.typescriptreact,*.js,*.jsx,*.javascriptreact,*.scss,*.css",
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.fileformat = "dos"
    end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end
})

-- Jenkinsfile
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "Jenkinsfile",
    callback = function()
        vim.opt.wrap = false
        vim.opt.formatoptions:remove("t")
    end
})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "Jenkinsfile",
    callback = function()
        require("jenkinsfile_linter").validate()
    end
})

-- Always show the signcolumn
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '100'

-- Store undo info in `~/.vimdid`
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.vimdid'
vim.opt.swapfile = false
vim.opt.backup = false

-- Higher update times lead to degraded experience
vim.opt.updatetime = 50

-- Map leader to ` `
vim.g.mapleader = " "

-- Netrw
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
