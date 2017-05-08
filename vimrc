" hdevieux Vim configuration

"----------------------------------"
"          General Stuff           "
"----------------------------------"
set history=50

let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w<cr>
nmap <leader>e :wq!<cr>
nmap <leader>q :q!<cr>
nmap <leader>s :ConqueTermVSplit bash<cr>
nmap <leader>d :ConqueTermSplit bash<cr>

" My notepad 
nmap <leader>n :vnew ~/tmp/notepad<cr>

execute pathogen#infect('~/.vim/bundle/{}')

set encoding=utf8

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

syntax enable
set showmatch

filetype plugin on

set number

set splitbelow
set splitright

" Disabling this for now
" set cursorline
" set nocursorcolumn


"----------------------------------"
"  Some Shell developement stuff   "
"----------------------------------"
autocmd Filetype sh setlocal expandtab ts=4 sw=4 sts=4

"----------------------------------"
"  Some Python developement stuff  "
"----------------------------------"
autocmd Filetype python setlocal expandtab ts=4 sw=4 sts=4
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args = "--max-line-length=160"

"----------------------------------"
"   Some C/C++ developement stuff  "
"----------------------------------"
autocmd Filetype cpp setlocal noexpandtab ts=4 sw=4 sts=4
autocmd Filetype c setlocal noexpandtab ts=4 sw=4 sts=4

"----------------------------------"
"    Some Go developement stuff    "
"----------------------------------"
autocmd Filetype go setlocal noexpandtab ts=4 sw=4 sts=4
let g:go_disable_autoinstall = 0

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"----------------------------------"
"             Colors               "
"----------------------------------"
colorscheme henri-default

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

" Easier switching between tabs
nmap <leader><tab> :tabn<cr>

" Switching between splits
nmap <leader>j <C-W><C-J>
nmap <leader>k <C-W><C-K>
nmap <leader>l <C-W><C-L>
nmap <leader>h <C-W><C-H>

"----------------------------------"
"           Airline Conf           "
"----------------------------------"
let g:airline_left_sep='>'

"----------------------------------"
"           Status Line            "
"----------------------------------"
" This one sucked....
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" This is the latest beauty. Still need to add some things. 
set statusline=%t[%{strlen(&fenc)?&fenc:'none'}]%m%r%y%=%c,%l/%L\ %P
