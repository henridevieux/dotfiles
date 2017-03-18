" Henris complete VIM config

"----------------------------------"
"          General Stuff           "
"----------------------------------"
set history=250

let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w<cr>
nmap <leader>e :wq!<cr>
nmap <leader>q :q!<cr>
nmap <leader>s :ConqueTermVSplit bash<cr>
nmap <leader>d :ConqueTermSplit bash<cr>
nmap <leader>j <C-W><C-W>

execute pathogen#infect('~/.vim/bundle/{}')
filetype plugin indent on

set runtimepath+=$HOME/.vim/plugin/

" put swap files in ~/tmp/
set directory=~/tmp/

"----------------------------------"
"           NERDTree setup         "
"----------------------------------"
set runtimepath+=$HOME/.vim/bundle/nerdtree

"Start NERDtree in the current path of VIM
"map my leader and t to open nerdtree
map <leader>t :NERDTree %:p:h<CR>

"Start my nerdtree plugin if no files are specified:
autocmd vimenter * if !argc() | NERDTree | endif

"----------------------------------"
"          User Interface          "
"----------------------------------"
set ignorecase
set smartcase
set incsearch

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ruler
set autoindent

set confirm

set hlsearch


"----------------------------------"
"           Airline Conf           "
"----------------------------------"
let g:airline_left_sep='>'


"----------------------------------"
" Some Python developement stuff:
"----------------------------------"
":filetype on
"set background=dark
"set tabstop=8
"set expandtab
"set softtabstop=4
"set shiftwidth=4
"filetype indent on
"let g:syntastic_python_checkers = ["flake8"]
"let g:syntastic_python_flake8_args = "--max-line-length=160"


"----------------------------------"
" Some C/C++ developement stuff:
"----------------------------------"
:filetype on
set background=dark
set tabstop=4
set noexpandtab
set softtabstop=4
set shiftwidth=4
filetype indent on


"----------------------------------"
"             Colors               "
"----------------------------------"
colorscheme henri-default
syntax enable
set showmatch

set encoding=utf8


"----------------------------------"
"          Moving Arond            "
"----------------------------------"
map <space> /
map <c-space> ?

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%


"----------------------------------"
"           Status Line            "
"----------------------------------"
" This one sucked....
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" This is the latest beauty
" Just have to figure out how to display current line out of total lines
set statusline=%t[%{strlen(&fenc)?&fenc:'none'}]%m%r%y%=%c,%l/%L\ %P
