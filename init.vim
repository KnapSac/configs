" General
set shell=cmd.exe
set nu
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
let g:ale_linters = { 'javascript': ['eslint'] }
let mapleader="\<Space>"
map <leader><leader> :bn<cr>
map <C-s> :up<cr>

" Theme
syntax on
colorscheme monokai
set termguicolors

" NERDTree
map <C-e> :NERDTreeToggle<CR>

" fzf
let g:fzf_layout = { 'down': '~25%' }
map <C-f> :Files<CR>

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

" Linter
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 1
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1

" Rust
let g:rustfmt_command = "rustfmt +nightly"
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" ==================================================                                                 
" Plugins
" ==================================================
call plug#begin()

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'
Plug 'crusoexia/vim-monokai'

" Fuzzy Finder
Plug 'preservim/nerdtree'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Language support
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'cmd install.sh' }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'Shougo/echodoc.vim'
Plug 'vim-scripts/haskell.vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
call plug#end()
