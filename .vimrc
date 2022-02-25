if &compatible
  set nocompatible " Be iMproved
endif

" Required:
" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/dein')

" Let dein manage dein
call dein#add(runtimepath)
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Solarized colorscheme
call dein#add('iCyMind/NeoSolarized')

" Vim airline ui and themes
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

" Access Unix shell commands from vim
call dein#add('tpope/vim-eunuch') 

" Run arbitrary git commands and view current git status
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive')

" File browser/tree, On-demand loading
call dein#add('scrooloose/nerdtree', { 'on':  'NERDTreeToggle' })

" Comment all the things
call dein#add('preservim/nerdcommenter')

" Autocomplete enclosing symbols
call dein#add('jiangmiao/auto-pairs')
call dein#add('machakann/vim-sandwich')

" Format js and jsx code
call dein#add('yuezk/vim-js')
call dein#add('maxmellon/vim-jsx-pretty')

" Code completion
call dein#add('neoclide/coc.nvim', {'branch': 'release'})
let g:coc_global_extensions = ['coc-git', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" Fancy icons for files types
Plug 'ryanoasis/vim-devicons')

" Find all the files
call dein#add('junegunn/fzf', { 'do': { -> fzf#install() } })
call dein#add('junegunn/fzf.vim')

" Allows running things like :SudaEdit ... 
call dein#add('lambdalisue/suda.vim')


" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
