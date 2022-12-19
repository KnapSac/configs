-- Source: https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/lua/theprimeagen/keymap.lua
local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

local nmap = bind("n", {noremap = false})
local nnoremap = bind("n")
local vnoremap = bind("v")
local inoremap = bind("i")

-- Deal with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Easier exiting of insert mode
inoremap("jj", "<Esc>")

-- Better yanking
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")

-- Netrw
nnoremap("<leader>pf", function()
    vim.cmd [[Lexplore!25]]
end)

-- Telescope
-- See `:help telescope.builtin`
nmap('<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
nmap('<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
nmap('<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
nmap('<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
nmap('<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
nmap('<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
nmap('<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
nnoremap('[d', vim.diagnostic.goto_prev)
nnoremap(']d', vim.diagnostic.goto_next)
nnoremap('<leader>e', vim.diagnostic.open_float)
nnoremap('<leader>q', vim.diagnostic.setloclist)

-- Vim fugitive mappings
nnoremap("<leader>gb", ":Git blame<CR>")
nnoremap("<leader>gs", ":Git<CR>")
nnoremap("<leader>gc", ":Git commit<CR>")
nnoremap("<leader>gph", ":Git push<CR>")
nnoremap("<leader>gpl", ":Git pull<CR>")

-- Easier navigation
nnoremap("<left>", ":bprev<CR>")
nnoremap("<right>", ":bnext<CR>")
nmap('<C-d>', '<C-d>zz')
nmap('<C-u>', '<C-u>zz')
