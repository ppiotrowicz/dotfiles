set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdtree'
Plugin 'mustache/vim-mustache-handlebars'
call vundle#end()
filetype plugin indent on

" plugin customizations
" air line
let g:airline#extensions#tabline#enabled = 1    " smarter tabline (shows buffers when there's only one tab open)
set laststatus=2				" always show status bar

" gitgutter
let g:gitgutter_sign_column_always = 1		" always show git gutter

" scheme
let &t_Co=256
set background=dark
colorscheme solarized

" stuff
syntax enable
set number					" show line numbers
set clipboard=unnamed				" system clipboard to * register
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a    " use mouse in console vim
highlight clear SignColumn
highlight GitGutterAdd guibg=234
highlight GitGutterChange guibg=234
highlight GitGutterDelete guibg=234
highlight GitGutterChangeDelete guibg=234

" associate *.todo with todo filetype
au BufRead,BufNewFile *.todo set filetype=todo

" Custom keybindings
let mapleader = ","

" shortcuts for Rails commands
map <Leader>m :Rmodel 
map <Leader>c :Rcontroller 
map <Leader>v :Rview 
map <Leader>u :Runittest 
map <Leader>f :Rfunctionaltest 
map <Leader>tm :RTmodel 
map <Leader>tc :RTcontroller 
map <Leader>tv :RTview 
map <Leader>tu :RTunittest 
map <Leader>tf :RTfunctionaltest 
map <Leader>sm :RSmodel 
map <Leader>sc :RScontroller 
map <Leader>sv :RSview 
map <Leader>su :RSunittest 
map <Leader>sf :RSfunctionaltest 

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
