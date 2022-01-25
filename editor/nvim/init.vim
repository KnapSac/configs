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
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

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
set shiftwidth=4                     " number of spaces to use for indenting
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
set termguicolors                    " use 24-bit colors

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

" code navigation
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" code actions
nmap <leader>n <Plug>(coc-diagnostic-next)
nmap <leader>p <Plug>(coc-diagnostic-prev)
nmap <leader>f <Plug>(coc-format-selected)
nmap <leader>a :CocAction<CR>

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
autocmd BufNewFile,BufEnter,BufRead *.json,*.ts,*.tsx,*.js,*.jsx,*.scss,*.css set shiftwidth=2 ff=dos
autocmd BufNewFile,BufEnter,BufRead *.hs set shiftwidth=2 ff=unix

" don't write a trailing new-line when writing C# files
autocmd BufNewFile,BufEnter,BufRead *.cs set nofixendofline

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

" https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
" Completion
" Use tab to trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Lightline
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Use autocmd to force lightline update
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
