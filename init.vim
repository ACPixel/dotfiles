call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'github/copilot.vim'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
call plug#end()
" Theme
set termguicolors
syntax on
colorscheme dracula


" Plugin Init
lua require("nvim-tree").setup()
lua require("bufferline").setup{}
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>]b :BufferLineCyclePrev<CR>
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
nnoremap <leader>f :NvimTreeOpen<CR>

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
