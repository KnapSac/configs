" Plugins
call plug#begin()

" Visual enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'

" General
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Semantic language support
"Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'

" Syntactic language support
Plug 'alx741/vim-hindent'
Plug 'cespare/vim-toml'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neovimhaskell/haskell-vim'
Plug 'PProvost/vim-ps1'
Plug 'rust-lang/rust.vim'
Plug 'sdiehl/vim-ormolu'
Plug 'stephpy/vim-yaml'
Plug 'vim-python/python-syntax'

call plug#end()

" General
lua require("knapsac");

set termguicolors

syntax on                            " enable syntax highlighting
colorscheme gruvbox                  " use `gruvbox` if possible
let g:gruvbox_contrast_dark = 'hard' " use hard contrast
set background=dark                  " dark-mode is best
filetype plugin on                   " load plugins based on filetype
filetype indent on                   " load indent settings based on filetype
set relativenumber                   " show relative line numbers
set number                           " show line numbers
set noshowmatch                      " don't auto jump to matching closing bracket
set hidden                           " allow unsaved buffers to be hidden
set visualbell                       " visual bell = no sounds
set undofile                         " store undo info in a file
set undodir=~/.vimdid                " where to store undo info
set autoindent                       " copy indent from previous line
set smartindent                      " automatically indent
set shiftwidth=4                     " number of spaces to use for indneting
set softtabstop=4                    " number of spaces to use when inserting a tab
set tabstop=4                        " show tabs as 4 spaces
set expandtab                        " convert tabs into spaces
set signcolumn=yes                   " always show the signcolumn
set colorcolumn=100                  " show the colorcolumn at column 100
set textwidth=100                    " wrap lines after 100 characters
set mouse=a                          " enable mouse support in all modes
set ignorecase                       " search case-insensitively...
set smartcase                        " ...unless uppercase characters are used
set incsearch                        " show current match while searching
set nohlsearch                       " don't highlight search results after search is finished
set notimeout                        " disable timeout for finishing a mapping key sequence
set updatetime=300                   " quicker diagnostic messages

let mapleader="\<Space>" " set <space> as the leader for mappings

" https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
" Wrapping
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" quicker saving
nmap <leader>w :w<CR>

" easier exiting of insert mode
imap jj <Esc>

" git mappings/settings
nmap <leader>gb :Git blame<CR>
nmap <leader>gs :Git<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gph :Git push<CR>
nmap <leader>gpl :Git pull<CR>
autocmd Filetype gitcommit setlocal spell tw=72 colorcolumn=73

" yanking
nmap <leader>y "+y
vmap <leader>y "+y

" make Y work as expected
nnoremap Y y$

" buffer and window mappings
map <leader><leader> :bn<cr>
map <C-s> :up<cr>
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" undo tree
nmap <leader>u :MundoToggle<CR>

" use jj to exit terminal input mode
:tnoremap jj <C-\><C-n>

" indent with only 2 spaces
autocmd BufNewFile,BufEnter,BufRead *.hs,*.json,*.ts,*.tsx,*.js,*.jsx,*.scss,*.css set shiftwidth=2 ff=dos

" file types
au BufRead,BufNewFile *.tsx set filetype=typescript.tsx
au BufRead,BufNewFile *.asm set filetype=masm
au BufRead,BufNewFile *.rs,*.toml set ff=unix

" https://github.com/awesome-streamers/awesome-streamerrc/blob/master/ThePrimeagen/init.vim
" remove whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Plugin Settings
" haskell
let g:haskell_classic_highlighting = 1
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1
let g:haskell_indent_if = 2
let g:haskell_indent_before_where = 2
let g:haskell_indent_case_alternative = 1
let g:haskell_indent_let_no_in = 0
let g:hindent_on_save = 0
let g:ormolu_suppress_stderr=1

" python
let g:python_highlight_all = 1

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" telescope
map <C-f> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>/ :lua require('telescope.builtin').grep_string()<CR>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ }

set completeopt=menuone,noinsert,noselect
let g:completion_enable_auto_popup = 1
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

inoremap <expr> <Tab>   pumVisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumVisible() ? "\<C-p>" : "\<S-Tab>"

imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

" configure LSP
lua << EOF
local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr,...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr,...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- mappings
  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<Space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<Space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<Space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<Space>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<Space>p', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

  require'completion'.on_attach(client)
end

local servers = { 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup{
    on_attach = on_attach,
    tools = {
      autoSetHints = false,
      hover_with_actions = false,
      inlay_hints = {
        parameter_hints_prefix = "> ",
        other_hints_prefix = "< ",
      },
    },
    server = {
      settings = {
        ["rust-analyzer"] = {
          checkOnSave =  {
            command = "clippy",
          }
        },
      },
    },
    flags = {
      debounce_text_changes = 150,
    },
--    handlers = {
--      ["textDocument/publishDiagnostics"] = vim.lsp.with(
--        vim.lsp.diagnostic.on_publish_diagnostics, {
--          update_in_insert = true,
--        }
--      ),
--    },
  }
end
EOF
