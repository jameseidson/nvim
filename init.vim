let tabSize=2
let &tabstop=tabSize
let &shiftwidth=tabSize

set expandtab
set smarttab
set smartindent
set mouse=a
set number
set showmatch
set wildmenu
set ttyfast
set virtualedit+=block
set whichwrap+=<,>,[,]
set title
set laststatus=0
set backspace=indent,eol,start
set background=dark
set clipboard=unnamed
set scrolloff=9999
set ruler
set formatoptions+=t
set showtabline=1
set splitbelow
set splitright
set diffopt=vertical
set formatoptions-=ro
set autoindent
set autowrite
set incsearch
set hlsearch
set smartcase
set ignorecase

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
