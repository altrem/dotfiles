set noshowmode
set number
set fillchars+=vert:│

call plug#begin('~/.local/share/nvim/plugged')

" File Exploring
Plug 'scrooloose/nerdtree'

" Lightline and colorschemes
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

" Fuzzy Finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" File Exploring Configuration
autocmd vimenter * NERDTree

" Lightline and Colorscheme Configuration
colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
hi VertSplit ctermbg=NONE guibg=NONE

" Fuzzy Finding Configuration
let g:fzf_layout = { 'down': '~25%' }
nnoremap <c-p> :FZF<cr>

" General Remappings
nnoremap <CR> G
tnoremap <Esc> <C-\><C-n>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
