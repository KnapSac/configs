" General
set shell=cmd.exe
let mapleader="\<Space>"
set number
set relativenumber
set colorcolumn=100
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Hotkeys
map <leader><leader> :bn<cr>
map <C-s> :up<cr>
map H <Home>
map L <End>
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

:autocmd InsertEnter,InsertLeave * set cul!

" Theme
syntax on
colorscheme monokai
set termguicolors

" NERDTree
map <C-e> :NERDTreeToggle<CR>

" fzf
let g:fzf_layout = { 'down': '~25%' }
map <C-f> :Files<CR>

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" Permanent undo
set undodir=~/.vimdid
set undofile

" Search
set ignorecase
set smartcase

" https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim 
" Completion
" Better display for messages
set cmdheight=2
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

" ==================================================                                                 
" Plugins
" ==================================================
call plug#begin()

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'crusoexia/vim-monokai'

" File management
Plug 'preservim/nerdtree'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Semantic language support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'Shougo/echodoc.vim'
Plug 'vim-scripts/haskell.vim'
Plug 'godlygeek/tabular'
call plug#end()
