" Defaults and Pathogen
execute pathogen#infect()
filetype plugin indent on
syntax on

" Some settings that aren't to my liking in vim-sensable
set nu " Line numbers
set title " Set window title
set hlsearch " Highlight search terms
set laststatus=2

" airline stuff
let g:airline_powerline_fonts = 1

" Use 2 spaces as tab
set expandtab
set tabstop=2
set shiftwidth=2

" Save backup and swap files in ~/.vim
set swapfile
set backup
set dir=~/.vim/backups
set backupdir=~/.vim/backups

" Solarized color theme
set background=dark
colorscheme solarized

" Password management
set cryptmethod=blowfish
autocmd BufReadPost * if &key != "" | set noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif

