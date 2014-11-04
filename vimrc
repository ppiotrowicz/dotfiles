set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
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
Plugin 'mileszs/ack.vim'
Plugin 'danro/rename.vim'
Plugin 'OrangeT/vim-csharp'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on

" -----------------------------------------------------------------------------
"  SETTINGS
" -----------------------------------------------------------------------------
let &t_Co=256             " use 256 colors
set background=dark       " use dark background
colorscheme solarized     " use solarized theme
syntax enable
set number					      " show line numbers
set clipboard=unnamed			" system clipboard to * register
set tabstop=2             " tab == 2 spaces
set shiftwidth=2          " << and >> use 2 spaces
set expandtab             " change tabs to spaces
set mouse=a               " use mouse in console vim
set scrolloff=3           " always show at least 3 lines at the top and bottom while scrolling
set hidden                " Handle multiple buffers better.
set wildmenu              " Enhanced command line completion.
set wildmode=list:longest " Complete files like a shell.
set ignorecase            " Case-insensitive searching.
set smartcase             " But case-sensitive if expression contains a capital letter.
set incsearch             " Highlight matches as you type.
set hlsearch              " Highlight matches.
set nobackup              " Don't make a backup before overwriting a file.
set nowritebackup         " And again.
set backupdir=~/.vim/backups  " save backups here
set directory=~/.vim/swaps    " and swaps here

" associate *.todo with todo filetype
au BufRead,BufNewFile *.todo set filetype=todo

" -----------------------------------------------------------------------------
" AIRLINE
" -----------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1    " smarter tabline (shows buffers when there's only one tab open)
let g:airline_powerline_fonts = 1               " use fonts from patched powerline fonts
set laststatus=2                                " always show status bar
set showtabline=2       " Always display the tabline, even if there is only one tab
set noshowmode          " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" -----------------------------------------------------------------------------
" GIT GUTTER
" -----------------------------------------------------------------------------
let g:gitgutter_sign_column_always = 1		" always show git gutter
highlight clear SignColumn
highlight GitGutterAdd guibg=234
highlight GitGutterChange guibg=234
highlight GitGutterDelete guibg=234
highlight GitGutterChangeDelete guibg=234

" -----------------------------------------------------------------------------
" SYNTASTIC
" -----------------------------------------------------------------------------
let g:syntastic_enable_signs=1
let g:syntastic_mode_map={ 'mode': 'active',
\ 'active_filetypes': [],
\ 'passive_filetypes': ['html', 'java'] }
let g:syntastic_coffee_checkers = ['coffeelint'] 
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "⚠"

" -----------------------------------------------------------------------------
" CTRL-P
" -----------------------------------------------------------------------------
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" -----------------------------------------------------------------------------
" KEYBOARD
" -----------------------------------------------------------------------------
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

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" CtrlP
map <C-p> :CtrlP<CR>
map <C-b> :CtrlPBuffer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" edit current vimrc
map <Leader>? :e ~/.vimrc<CR>
map <Leader>/ :so $MYVIMRC<CR>
