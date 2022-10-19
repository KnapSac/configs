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
nnoremap("<leadery", "\"+y")
vnoremap("<leadery", "\"+y")

-- Telescope
nnoremap("<C-f>", function()
    require("telescope.builtin").find_files()
end)
nnoremap("<leader/", function()
    require("telescope.builtin").grep_string()
end)

-- Vim fugitive mappings
nnoremap("<leader>gb", ":Git blame<CR>")
nnoremap("<leader>gs", ":Git<CR>")
nnoremap("<leader>gc", ":Git commit<CR>")
nnoremap("<leader>gph", ":Git push<CR>")
nnoremap("<leader>gpl", ":Git pull<CR>")
