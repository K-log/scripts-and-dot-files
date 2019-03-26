call plug#begin()

Plug 'itchyny/lightline.vim'

Plug 'ervandew/supertab'

Plug 'iCyMind/NeoSolarized'

Plug 'tpope/vim-eunuch' 

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'Valloric/YouCompleteMe'

call plug#end()


set termguicolors
set number
colorscheme NeoSolarized
set background=dark

" 4 space tabs expanded to spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab


tnoremap <Esc> <C-\><C-n>

" NerdTree commands
"autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



