set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'shougo/unite.vim'
Plugin 'shougo/neomru.vim'
Plugin 'shougo/vimproc.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'sirver/ultisnips'
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
Plugin 'ervandew/supertab'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
call vundle#end()
filetype plugin indent on

" -----------------------------------------------------------------------------
"  THEME
" -----------------------------------------------------------------------------
let &t_Co=256             " use 256 colors
set background=dark       " use dark background
let g:gruvbox_sign_column = 'dark0'
colorscheme gruvbox       " use gruvbox theme

" -----------------------------------------------------------------------------
"  SETTINGS
" -----------------------------------------------------------------------------
syntax enable
set number					      " show line numbers
set clipboard=unnamed			" system clipboard to * register
set tabstop=2             " tab == 2 spaces
set shiftwidth=2          " << and >> use 2 spaces
set expandtab             " change tabs to spaces
set mouse=                " use mouse in console vim
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

" whitespace 
set listchars=tab:▸\ ,eol:¬,trail:·
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

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
" YouCompleteMe
" -----------------------------------------------------------------------------
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>', '<Enter>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_key_invoke_completion = '<leader><Space>'

" -----------------------------------------------------------------------------
" UNITE
" -----------------------------------------------------------------------------
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
let g:unite_source_rec_max_cache_files=5000
let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'

nnoremap <space>p :<C-U>Unite -auto-resize -buffer-name=file file_rec/async:!<cr>
nnoremap <space>b :<C-u>Unite -auto-resize -buffer-name=buffer buffer<cr>
nnoremap <space>y :<C-u>Unite -auto-resize -buffer-name=yank history/yank<cr>
nnoremap <space>t :<C-u>Unite -auto-resize -buffer-name=outline -start-insert OmniSharp/findtype<cr>
nnoremap <space>s :<C-u>Unite -auto-resize -buffer-name=outline -start-insert OmniSharp/findsymbols<cr>
nnoremap <space>/ :<C-u>Unite grep:.<cr>

" -----------------------------------------------------------------------------
" ULTISNIPS
" -----------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" -----------------------------------------------------------------------------
" OMNISHARP
" -----------------------------------------------------------------------------
" OmniSharp won't work without this setting
filetype plugin on

let g:OmniSharp_host = "http://localhost:2000"

"Set the type lookup function to use the preview window instead of the status line
let g:OmniSharp_typeLookupInPreview = 0

"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1

set noshowmatch

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

augroup omnisharp_commands
    autocmd!
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    "autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
    "autocmd BufWritePost *.cs call OmniSharp#AddToProject()
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.
    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    autocmd FileType cs nnoremap <leader>t :!bundle exec rake tests<cr>
    autocmd FileType cs nnoremap <leader>rt :OmniSharpRunTestFixture<cr>
    autocmd FileType cs nnoremap <leader>ra :OmniSharpRunAllTests<cr>
    autocmd FileType cs nnoremap <leader>rr :OmniSharpRunLastTests<cr>
    autocmd FileType cs nnoremap <leader>ru :OmniSharpRunTests<cr>
    "autocmd FileType cs nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
    "autocmd FileType cs vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

    " rename with dialog
    autocmd FileType cs nnoremap <leader>nm :OmniSharpRename<cr>
    " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
    command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

    " Force OmniSharp to reload the solution. Useful when switching branches etc.
    " autocmd FileType cs nnoremap <leader>rl :OmniSharpReloadSolution<cr>
    " autocmd FileType cs nnoremap <leader>cf :OmniSharpCodeFormat<cr>
    " Load the current .cs file to the nearest project
    " autocmd FileType cs nnoremap <leader>tp :OmniSharpAddToProject<cr>

    " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
    autocmd FileType cs nnoremap <leader>ss :OmniSharpStartServer<cr>
    autocmd FileType cs nnoremap <leader>sp :OmniSharpStopServer<cr>

    " Add syntax highlighting for types and interfaces
    " autocmd FileType cs nnoremap <leader>th :OmniSharpHighlightTypes<cr>
    autocmd FileType cs setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
augroup END

" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
"set cmdheight=2

" -----------------------------------------------------------------------------
" ACK / AG
" -----------------------------------------------------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" -----------------------------------------------------------------------------

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
" -----------------------------------------------------------------------------
" KEYBOARD
" -----------------------------------------------------------------------------
let mapleader = ","

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Whitespace
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" Format file
nmap _= :call Preserve("normal gg=G")<CR>

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" edit current vimrc
map <Leader>? :e ~/.vimrc<CR>
map <Leader>/ :so $MYVIMRC<CR>

" other
nnoremap <leader>rm :call delete(expand('%')) \| bdelete!<CR>
cmap w!! w !sudo tee > /dev/null %
