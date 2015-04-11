let mapleader = ","

runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" APPEARANCE
syntax on
set background=dark
colorscheme solarized

filetype plugin indent on

set nowrap
set linebreak

set title
set visualbell
set showcmd
set showmode
set relativenumber
set cursorline

let g:airline_powerline_fonts = 1

" Powerline font choices, ranked by preferences. Test: 0oO 1li 
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10 "really nice
"set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12 "really nice
"set guifont=Meslo\ LG\ S\ for\ Powerline
"set guifont=Anonymous\ Pro\ for\ Powerline
"set guifont=Liberation\ Mono\ for\ Powerline "nice, clean
"set guifont=Inconsolata\ for\ Powerline "smaller v of above
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline "fine, clean
"set guifont=Sauce\ Code\ Powerline
"set guifont=Fira\ Mono\ for\ Powerline "serify
"set guifont=monofur\ for\ Powerline
"set guifont=Droid\ Sans\ Mono\ for\ Powerline "quite nice, compact, but 0 and O a bit hard to distinguish

" alternatives
"set guifont=Inconsolata\-g\ for\ Powerline "thin, a bit serify
"set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline "fairly nice, somewhat serif
"set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline "nicer, less tall

" show trailing whitespace
set list listchars=tab:\ \ ,trail:·

" INDENTATION
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" PERSISTENT UNDO
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" TEMPFILES
silent !mkdir ~/.vim/temp > /dev/null 2>&1
set backupdir=~/.vim/temp
set directory=~/.vim/temp

" SCROLLING
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" FOLDING
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" BUFFERS
set hidden " allow hiding a buffer without saving changes

" MISC --------------------------------------------------------------

set history=1000      "store lots of commandline history

" jump to the column saved in a mark, not just the line
nnoremap ' `
nnoremap ` '

runtime macros/matchit.vim "`%` jumps between more open/close delimiters

set wildmenu               "show me possible tab-completions
set wildmode=list:longest  "complete up to the point of ambiguity

" perform case-sensitive searches only if the keyword has uppercase
set ignorecase
set smartcase

nmap <silent> // :silent :nohlsearch<CR>

set autoread               "automatically reload changes

"save a SHIFT keypress for commands
nmap ; :

au BufWritePost .vimrc,vimrc so $MYVIMRC  "reload vimrc automatically when saved

set guioptions=aegit
