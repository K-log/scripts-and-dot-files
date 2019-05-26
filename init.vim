call plug#begin()

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Plug 'itchyny/lightline.vim'

Plug 'ervandew/supertab'

Plug 'iCyMind/NeoSolarized'

Plug 'tpope/vim-eunuch' 

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'Valloric/YouCompleteMe'

Plug 'christoomey/vim-tmux-navigator'

Plug 'ternjs/tern_for_vim'

call plug#end()


set termguicolors
set number
colorscheme NeoSolarized
set background=dark

" 4 space tabs expanded to spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab


tnoremap <Esc> <C-\><C-n>

" Disable Arrow keys in Escape mode
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" Disable Arrow keys in Insert mode
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

" NerdTree commands
"autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"YCM commands
"autocmd CompleteDone * pclose
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1



