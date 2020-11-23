" ------ Plugins -----
call plug#begin()

" GUI enhancements
Plug 'itchyny/lightline.vim'
"Plug 'mengelbrecht/lightline-bufferline'
Plug 'machakann/vim-highlightedyank'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'

" File management
Plug 'preservim/nerdtree'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" tpope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" --- Language Support ---

" General
Plug 'Shougo/echodoc.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Typescript
"Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

" Rust
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'

" Powershell
Plug 'PProvost/vim-ps1'

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'alx741/vim-stylishask'

" Python
Plug 'vim-python/python-syntax'

" Firenvim
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()

" ----- neovimhaskell/haskell-vim -----
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

" ----- hindent & stylish-haskell -----
let g:hindent_on_save = 0
"let g:stylishask_on_save = 1

function! HaskellFormat(which) abort
    if a:which ==# 'hindent' || a:which ==# 'both'
        :Hindent
    endif
    if a:which ==# 'stylish' || a:which ==# 'both'
        silent! exe 'undojoin'
        silent! exe 'keepjumps %!stylish-haskell'
    endif
endfunction

" ----- General -----
set relativenumber
set number
set noshowmatch
set nohlsearch
set hidden
set noerrorbells
set smartindent
set nobackup
set shell=cmd.exe
let mapleader="\<Space>"
set colorcolumn=100
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set signcolumn=yes
set cmdheight=2
set autoread

autocmd BufNewFile,BufEnter,BufRead *.hs,*.json set shiftwidth=2 

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" ----- Appearance -----
colorscheme gruvbox
set background=dark
syntax on
filetype plugin indent on

" ----- Hotkeys -----
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
imap jj <Esc>

:autocmd InsertEnter,InsertLeave * set cul!
au BufRead,BufNewFile *.tsx set filetype=typescript.tsx

augroup haskellStylish
    au!
    au FileType haskell nnoremap <leader>hi :Hindent<CR>
    au FileType haskell nnoremap <leader>hs :call HaskellFormat('stylish')
    au FileType haskell nnoremap <leader>hf :call HaskellFormat('both')
augroup END

au BufEnter github.com_*.txt set filetype=markdown
au BufEnter txti.es*.txt set filetype=typescript

" Python
let g:python_highlight_all = 1

" NERDTree
map <C-e> :NERDTreeToggle<CR>

" fzf
let g:fzf_layout = { 'down': '~25%' }
"let $FZF_DEFAULT_COMMAND = 'ag -g "" '
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

let g:mkdp_auto_start = 1
let g:mkdp_refresh_slow = 1
let g:mkdp_browser = 'edge'

" Lightline
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
