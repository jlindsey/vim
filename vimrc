" Defaults and Pathogen
filetype off
execute pathogen#infect()
filetype plugin indent on
syntax on

" remap <leader> to ,
let mapleader = ","

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
set autoread
set autowrite

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

" ctrl-p.vim
nno <leader><leader> :CtrlP<cr>

" Clipboard copy
vno <C-c> "+y

" multi-cursor
let g:multi_cursor_next_ke = '<C-d>'

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

" airline stuff
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

" rainbow parens
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Jekyll
let g:jekyll_post_extension = '.markdown'
let g:jekyll_post_filetype = 'markdown'
let g:jekyll_build_command = 'bundle exec jekyll build BLOG_ROOT'

" syntastic
let g:syntastic_python_checkers = ['pylint', 'pyflakes']
let g:syntastic_ruby_checkers = ['ruby-lint', 'ruby']
let g:syntastic_rails_checkers = ['ruby-lint', 'ruby']
let g:syntastic_quiet_messages = { "regex": ['\m\[line-too-long\]'] }

" ack
let g:ack_use_dispatch = 1
let g:ack_autofold_results = 1

" indentLine
let g:indentLine_char = '┆'

" NERDtree
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <leader>N :NERDTree<cr>

" Language-specific
au Syntax python set tabstop=4
au Syntax python set shiftwidth=4

au Syntax markdown setl textwidth=110
au Syntax markdown setl formatoptions=aw2tq

