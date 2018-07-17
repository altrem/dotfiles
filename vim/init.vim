set noshowmode
set number
set fillchars+=vert:│

call plug#begin('~/.local/share/nvim/plugged')

" File Exploring
Plug 'scrooloose/nerdtree'

" Lightline and colorschemes
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'morhetz/gruvbox'

" Fuzzy Finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Surround
Plug 'tpope/vim-surround'

" Linting
Plug 'w0rp/ale'

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" File Exploring Configuration
autocmd vimenter * NERDTree

" Lightline and Colorscheme Configuration
colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE
hi VertSplit ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi ALEErrorSign ctermbg=NONE guibg=NONE
hi ALEWarningSign ctermbg=NONE guibg=NONE
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'colorscheme': 'gruvbox',
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Fuzzy Finding Configuration
let g:fzf_layout = { 'down': '~25%' }
nnoremap <c-p> :FZF<cr>

" Autocompletion Configuration
let g:deoplete#enable_at_startup = 1

" General Remappings
nnoremap <CR> G
tnoremap <Esc> <C-\><C-n>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
