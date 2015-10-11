set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" navigation
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/unite.vim'
Plugin 'tsukkee/unite-tag'

" general
Plugin 'Shougo/vimproc.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" themes
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'

" ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
Plugin 'thoughtbot/vim-rspec'

" c#
Plugin 'OrangeT/vim-csharp'
Plugin 'OmniSharp/omnisharp-vim'

" elixir
Plugin 'elixir-lang/vim-elixir'

" coffeescript
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'

" json
Plugin 'elzr/vim-json'
call vundle#end()

filetype plugin indent on

" -----------------------------------------------------------------------------
"  THEME
" -----------------------------------------------------------------------------
let &t_Co=256             " use 256 colors

" DARK THEME
set background=dark       " use dark background
let g:gruvbox_sign_column = 'dark0'
colorscheme gruvbox       " use gruvbox theme

" LIGHT THEME
" colorscheme Tomorrow       " use Tomorrow theme
" set background=light       " use light background

" -----------------------------------------------------------------------------
"  SETTINGS
" -----------------------------------------------------------------------------
syntax enable
set number                    " show line numbers
set relativenumber            " shows line numbers relative to current line
set clipboard=unnamed         " system clipboard to * register
set tabstop=2                 " tab == 2 spaces
set shiftwidth=2              " << and >> use 2 spaces
set expandtab                 " change tabs to spaces
set mouse=                    " don't use mouse in console vim
set scrolloff=5               " always show at least 3 lines at the top and bottom while scrolling
set hidden                    " Handle multiple buffers better.
set wildmenu                  " Enhanced command line completion.
set wildmode=list:longest     " Complete files like a shell.
set ignorecase                " Case-insensitive searching.
set smartcase                 " But case-sensitive if expression contains a capital letter.
set incsearch                 " Highlight matches as you type.
set hlsearch                  " Highlight matches.
set nobackup                  " Don't make a backup before overwriting a file.
set nowritebackup             " And again.
set backupdir=~/.vim/backups  " save backups here
set directory=~/.vim/swaps    " and swaps here
set backspace=2               " backspace for normal human beings
set autoread                  " If a file is changed outside of vim, automatically reload it without asking
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set splitbelow                " open horizontal split below current window
set splitright                " open vertical split to the right of the current window
set nowrap                    " do not wrap stuff
set lazyredraw                " redraw only when we need to.
set showmatch                 " highlight matching [{()}]

let mapleader = "\<space>"

" -----------------------------------------------------------------------------
"  WHITESPACE
" -----------------------------------------------------------------------------
set listchars=tab:▸\ ,eol:¬,trail:·
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" -----------------------------------------------------------------------------
"  NERDTREE
" -----------------------------------------------------------------------------
let g:NERDTreeWinSize=40

" -----------------------------------------------------------------------------
" AIRLINE
" -----------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1 " smarter tabline (shows buffers when there's only one tab open)
let g:airline_powerline_fonts = 1            " use fonts from patched powerline fonts
set laststatus=2                             " always show status bar
set showtabline=2                            " Always display the tabline, even if there is only one tab
set noshowmode                               " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" -----------------------------------------------------------------------------
" GIT GUTTER
" -----------------------------------------------------------------------------
let g:gitgutter_sign_column_always = 1		   " always show git gutter
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
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'ruby': 1
      \}

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
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '-i --vimgrep --hidden --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif

nnoremap <leader>p :Unite -auto-resize -buffer-name=file file_rec/async:!<cr>
nnoremap <leader>o :Unite -auto-resize -buffer-name=buffer buffer<cr>
nnoremap <leader>/ :Unite grep:.<cr>

autocmd FileType cs nnoremap <leader>f :Unite -auto-resize -buffer-name=outline -start-insert OmniSharp/findtype<cr>
autocmd FileType cs nnoremap <leader>s :Unite -auto-resize -buffer-name=outline -start-insert OmniSharp/findsymbols<cr>

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
filetype plugin on

let g:OmniSharp_host = "http://localhost:2000"

"Set the type lookup function to use the preview window instead of the status line
let g:OmniSharp_typeLookupInPreview = 0

"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1


set completeopt=longest,menuone

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

augroup omnisharp_commands
    autocmd!
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    "autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    autocmd FileType cs nnoremap <leader>t :!bundle exec rake tests<cr>
    autocmd FileType cs nnoremap <leader>rt :OmniSharpRunTestFixture<cr>
    autocmd FileType cs nnoremap <leader>ra :OmniSharpRunAllTests<cr>
    autocmd FileType cs nnoremap <leader>rr :OmniSharpRunLastTests<cr>
    autocmd FileType cs nnoremap <leader>ru :OmniSharpRunTests<cr>
    "autocmd FileType cs nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
    autocmd FileType cs nnoremap <leader>nm :OmniSharpRename<cr>
    autocmd FileType cs nnoremap <leader>tp :OmniSharpAddToProject<cr>
    autocmd FileType cs nnoremap <leader>ss :OmniSharpStartServer<cr>
    autocmd FileType cs nnoremap <leader>sp :OmniSharpStopServer<cr>

    autocmd FileType cs setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
    autocmd FileType cs let &colorcolumn="120"
augroup END

set updatetime=500 " ms

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

" turn off search highlight
nnoremap <leader>h :noh<CR>

nnoremap Y y$

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
map <c-n> :NERDTreeToggle<CR>
map <c-f> :NERDTreeFind<CR>

" edit current vimrc
map <leader>? :e ~/.vimrc<CR>
" reload vimrc
" map <leader>/ :so $MYVIMRC<CR>

" delete current file
nnoremap <leader>rm :call delete(expand('%')) \| bdelete!<CR>

" save
nnoremap <leader>w :w<CR>

" show quickfix window
nnoremap <leader>q :cl<cr>

" save as root
cmap w!! w !sudo tee > /dev/null %

" close current buffer
nnoremap <leader>x :bd<cr>

" reformat json
autocmd FileType json nnoremap <leader>= :%!python -m json.tool<CR>

" rebalance windows on terminal resize
autocmd VimResized * :wincmd =

" zoom current window
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
" rebalance windows
nnoremap <leader>= :wincmd =<cr>

nnoremap <leader>* :Ack <c-r><c-w><CR>

" RSpec.vim mappings
let g:rspec_command = "Dispatch bundle exec rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#H',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}
