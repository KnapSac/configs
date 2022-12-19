local Remap = require("knapsac.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- Quiker saving
nnoremap("<leader>w", ":w<CR>")

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
nnoremap("<C-f>", function()
    require("telescope.builtin").find_files()
end)
nnoremap("<leader>/", function()
    require("telescope.builtin").live_grep()
end)
nnoremap("<leader>b", function()
    require("telescope.builtin").buffers()
end)
nnoremap("<leader>\\", function()
    require("telescope.builtin").lsp_document_symbols()
end)
nnoremap("<C-t>", function()
    require("telescope.builtin").lsp_workspace_symbols()
end)
nnoremap("gi", function()
    require("telescope.builtin").lsp_implementations()
end)

-- Formatting
nnoremap("<leader>f", ":FormatWrite<CR>")

-- Vim fugitive mappings
nnoremap("<leader>gb", ":Git blame<CR>")
nnoremap("<leader>gs", ":Git<CR>")
nnoremap("<leader>gc", ":Git commit<CR>")
nnoremap("<leader>gph", ":Git push<CR>")
nnoremap("<leader>gpl", ":Git pull<CR>")

-- Easier navigation
nnoremap("<left>", ":bprev<CR>")
nnoremap("<right>", ":bnext<CR>")
