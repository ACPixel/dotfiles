call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'github/copilot.vim'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep', { 'do': 'cargo install ripgrep' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()
" Theme
set termguicolors
syntax on
colorscheme dracula

" set airline theme
let g:airline_theme='solarized'
let g:airline_solairized_bg='dark'
let g:airline_powerline_fonts = 1


" Plugin Init
filetype plugin on
"let g:airline#extensions#tabline#enabled = 0
lua require("nvim-tree").setup()
lua require("bufferline").setup{}
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>]b :BufferLineCyclePrev<CR>
nnoremap <silent>bc :BufferLinePickClose<CR>
nnoremap <silent>bp :BufferLinePick<CR>
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'json': ['prettier'],
\   'graphql': ['prettier'],
\   'yaml': ['prettier'],
\   'markdown': ['prettier'],
\   'rust': ['rustfmt']
\}
let g:ale_fix_on_save = 1

" CoC Config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Code position
set number
set ruler

" Indentation
set autoindent
:set tabstop=2
:set shiftwidth=0

" Remap escape key
inoremap kj <Esc>

" Keybind for file explorer
set splitright
nnoremap <leader>f :NvimTreeToggle<CR>
nnoremap <leader>F :NvimTreeFindFile<CR>

" default file encoding
set encoding=utf-8

" Line wrap
set wrap

" Function to set tab width to n spaces
function! SetTab(n)
    let &l:tabstop=a:n
    let &l:softtabstop=a:n
    let &l:shiftwidth=a:n
    set expandtab
endfunction

command! -nargs=1 SetTab call SetTab(<f-args>)

" Highlight search results
set hlsearch
set incsearch

" Mouse support
set mouse=a



" Custom keybinds
nnoremap <silent>[l :lnext<CR>
nnoremap <silent>]l :lprev<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap ev :e $MYVIMRC<CR>

nnoremap rv :w!<Esc>:source $MYVIMRC<CR>


" Telescope

nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ga :Git add %<cr> 
nnoremap <leader>gaa <cmd>Git add .<cr>
nnoremap <leader>gs <cmd>Git status<cr>
nnoremap <leader>gc :Git commit -m ""<Left>
nnoremap <leader>gp :Git push
nnoremap <leader>gl :Git pull<cr>
