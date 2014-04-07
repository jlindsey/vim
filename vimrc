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

" reload current vimrc
nmap <leader>R :so $MYVIMRC<cr>

" working with buffers
set hidden
" ,t Open a new empty buffer
nmap <leader>T :enew<cr>
" ,l Next buffer
nmap <leader>l :bnext<cr>
" ,h Previous buffer
nmap <leader>h :bprevious<cr>
" ,bq Close current buffer and move to the previous one
nmap <leader>bq :bp <bar> bd #<cr>
" Show all open buffers
nmap <leader>bl :ls<cr>

" splits
" ,w vertical split current file and switch to it
nmap <leader>w <C-w>s<C-W>l
" movement
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

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
set listchars=tab:▸\ ,eol:¬

" airline stuff
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Use 2 spaces as tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Save backup and swap files in ~/.vim
set swapfile
set backup
set undofile  " persist file undo history
set dir=~/.vim/backups
set backupdir=~/.vim/backups
set undodir=~/.vim/backups

" Solarized color theme
set background=dark
colorscheme solarized

" Password management
set cryptmethod=blowfish
autocmd BufReadPost * if &key != "" | set noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif

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

