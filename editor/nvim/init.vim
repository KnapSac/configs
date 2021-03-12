" ----- Plugins -----
call plug#begin()

" Visual enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'

" General
Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Semantic language support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Syntactic language support
Plug 'maxmellon/vim-jsx-pretty'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'PProvost/vim-ps1'
Plug 'vim-python/python-syntax'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'sdiehl/vim-ormolu'

call plug#end()

" ----- General -----
lua require("knapsac");

set relativenumber
set number
set noshowmatch
set hidden
set noerrorbells
set smartindent
set nobackup
set noswapfile
let mapleader="\<Space>"
set colorcolumn=100
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set signcolumn=yes
set cmdheight=2
set autoread
set encoding=utf-8
set mouse=a

autocmd BufNewFile,BufEnter,BufRead *.hs,*.json,*.ts,*.tsx,*.js,*.jsx set shiftwidth=2
:autocmd InsertEnter,InsertLeave * set cul!
au BufRead,BufNewFile *.tsx set filetype=typescript.tsx

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Permanent undo
set undodir=~/.vimdid
set undofile

" Search
set ignorecase
set smartcase
set gdefault
set incsearch
set nohlsearch

" Quick-save
nmap <leader>w :w<CR>

" https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
" Wrapping
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" https://github.com/awesome-streamers/awesome-streamerrc/blob/master/ThePrimeagen/init.vim
" Remove whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup KNAPSAC
    autocmd!
    autocmd BufWritePre *[^.md] :call TrimWhitespace()
augroup END

" ----- Appearance -----
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark
syntax on
filetype plugin indent on

" ----- Hotkeys -----
imap jj <Esc>

map <leader><leader> :bn<cr>
map <C-s> :up<cr>
map H ^
map L $
map q: :q

nnoremap j gj
nnoremap k gk

nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" diagnostics
nmap <leader>n <Plug>(coc-diagnostic-next)
nmap <leader>p <Plug>(coc-diagnostic-prev)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" actions
nmap <leader>a :CocAction<CR>

" yanking
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" ----- Plugin Settings -----
" haskell-vim
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

" hindent
let g:hindent_on_save = 0

" Python
let g:python_highlight_all = 1

" NERDTree
map <C-e> :NERDTreeToggle<CR>

" telescope
"map <C-f> :lua require('telescope.builtin').find_files()<CR>
map <C-f> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>/ :lua require('telescope.builtin').grep_string()<CR>

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
" Completion
" Better display for messages
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
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

" ormolu
let g:ormolu_suppress_stderr=1

" fugitive
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
