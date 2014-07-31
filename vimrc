"" Vundle
set nocp
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" Plugins
Plugin 'gmarik/Vundle.vim' " Required

" the pope's blessings
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'

Plugin 'altercation/vim-colors-solarized'
Plugin 'sheerun/vim-polyglot'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/vimproc.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'idanarye/vim-merginal'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim'

call vundle#end()
filetype plugin indent on
syntax on

" remap <leader> to ,
let mapleader = ","

" Command Abbreviations
ca !! VimProcBang

" General settings
set nu " Line numbers
set rnu " Set relative line numbers
set title " Set window title
set scrolloff=3 " Keep at least 3 lines visible above + below cursor
set cursorline " Highlight the current line
set showmode " Show current file mode
set wildmenu " expand wildcards in commands on <tab>
set wildmode=list:longest
set ttyfast " Force vim to think we're on a fast tty connection (we are)
set visualbell " visual bell instead of audio
set modeline " Allow modelines
set autoread
set autowrite
set grepprg=ack

" reload current vimrc
nmap <leader>R :so $MYVIMRC<cr>

" working with buffers
set hidden
" ,t Open a new empty buffer
nmap <leader>T :enew<cr>
" ,l Next buffer
nmap <leader>j :bnext<cr>
nno gt :bnext<cr>
" ,h Previous buffer
nmap <leader>k :bprevious<cr>
nno gT :bprevious<cr>
" ,q Close current buffer and move to the previous one
nmap <leader>q :bp <bar> bd #<cr>
" Show all open buffers
nmap <leader>bl :ls<cr>

" splits
" ,w vertical split current file and switch to it
nmap <leader>w <C-w>s<C-W>l
" movement
nno <C-h> <C-w>h
nno <C-j> <C-w>j
nno <C-k> <C-w>k
nno <C-l> <C-w>l
nno <up> <nop>
nno <down> <nop>
nno <left> <nop>
nno <right> <nop>
vno <up> <nop>
vno <down> <nop>
vno <left> <nop>
vno <right> <nop>
nno j gj
nno k gk

" Clipboard copy
vno <C-c> "+y

" Searching
set ignorecase
set smartcase " intelligently deal with case-sensative search
set gdefault " default global replace
set incsearch
set showmatch
set hlsearch " Highlight search terms
" Clear current seach with ,<space>
nmap <leader><space> :noh<cr>
" move around between matching bracket groups with <tab>
nnoremap <tab> %
vnoremap <tab> %

" show hidden characters
set list
set listchars=eol:¬,tab:→\ ,extends:>,precedes:<,trail:…

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Use 2 spaces as tab
set expandtab
set tabstop=2
set shiftwidth=2

" Save backup and swap files in ~/.vim
set swapfile
set backup
set undofile " persist file undo history
set dir=~/.vim/backups
set backupdir=~/.vim/backups
set undodir=~/.vim/backups
au FocusLost * :wa " Autosave

" Solarized color theme
set background=dark
colorscheme solarized

" Password management
set cryptmethod=blowfish
au BufReadPost * if &key != "" | set noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif

"  Parentheses colours using Solarized
let g:rbpt_colorpairs = [
  \ [ '13', '#6c71c4'],
  \ [ '5',  '#d33682'],
  \ [ '1',  '#dc322f'],
  \ [ '9',  '#cb4b16'],
  \ [ '3',  '#b58900'],
  \ [ '2',  '#859900'],
  \ [ '6',  '#2aa198'],
  \ [ '4',  '#268bd2'],
  \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" multi-cursor
let g:multi_cursor_next_ke = '<C-d>'

" syntastic
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_python_checker_args = '--max-complexity=12'
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" ack
let g:ack_use_dispatch = 1
let g:ack_autofold_results = 1

" ctrl-p.vim
nno <C-p> :CtrlP<cr>

" csv
let b:csv_arrange_leftalign = 1
let g:csv_autocmd_arrange = 1

"YCM
set completeopt-=preview
let g:ycm_warning_symbol = '>>'
let g:ycm_error_symbol = '!!'
let g:ycm_allow_changing_updatetime = 1
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 0
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" VimShell
nno <leader>s :VimShell<cr>
nno <leader>S :VimShellInteractive bundle exec rails c<cr>

" Language-specific
au Syntax python setlocal tabstop=4
au Syntax python setlocal shiftwidth=4

au Syntax markdown setlocal textwidth=110
au Syntax markdown setlocal formatoptions=aw2tq
au Syntax markdown setlocal spell spelllang=en_us

