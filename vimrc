set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
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
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/neocomplete.vim'
call vundle#end()
filetype plugin indent on

" -----------------------------------------------------------------------------
"  THEME
" -----------------------------------------------------------------------------
let &t_Co=256             " use 256 colors
set background=dark       " use dark background
let g:gruvbox_sign_column = 'dark0'
colorscheme gruvbox       " use gruvbox theme

if !has("gui_running")
   let g:gruvbox_italic=0
endif

" -----------------------------------------------------------------------------
"  SETTINGS
" -----------------------------------------------------------------------------
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
set backspace=2           " backspace for normal human beings
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set autoread              " If a file is changed outside of vim, automatically reload it without asking

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
" highlight GitGutterAdd guibg=235
" highlight GitGutterChange guibg=235
" highlight GitGutterDelete guibg=235
" highlight GitGutterChangeDelete guibg=235

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
" OMNISHARP
" -----------------------------------------------------------------------------
" OmniSharp won't work without this setting
filetype plugin on

"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"

"Set the type lookup function to use the preview window instead of the status line
"let g:OmniSharp_typeLookupInPreview = 1

"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

"Super tab settings - uncomment the next 4 lines
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests. 
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr> "finds members in the current buffer
    " cursor can be anywhere on the line containing an issue 
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>  
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    autocmd FileType cs nnoremap <leader>t :!bundle exec rake tests<cr>
    "autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr> "navigate up by method/property/field
    "autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr> "navigate down by method/property/field
    autocmd FileType cs setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
augroup END

" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
"set cmdheight=2

" Contextual code actions (requires CtrlP)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>      
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

" -----------------------------------------------------------------------------
" KEYBOARD
" -----------------------------------------------------------------------------
let mapleader = ","

" shortcuts for Rails commands
"map <Leader>m :Rmodel
"map <Leader>c :Rcontroller
"map <Leader>v :Rview
"map <Leader>u :Runittest
"map <Leader>f :Rfunctionaltest
"map <Leader>tm :RTmodel
"map <Leader>tc :RTcontroller
"map <Leader>tv :RTview
"map <Leader>tu :RTunittest
"map <Leader>tf :RTfunctionaltest
"map <Leader>sm :RSmodel
"map <Leader>sc :RScontroller
"map <Leader>sv :RSview
"map <Leader>su :RSunittest
"map <Leader>sf :RSfunctionaltest

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

" edit current vimrc
map <Leader>? :e ~/.vimrc<CR>
map <Leader>/ :so $MYVIMRC<CR>
