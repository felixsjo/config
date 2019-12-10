set shortmess+=I
set mouse=a
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set laststatus=3
set background=dark
set autochdir
set noswapfile
set nobackup
set noundofile
set scrolloff=10
set cursorline
set relativenumber

syntax enable

colorscheme simple-dark
hi NonText guifg=bg

hi TabLineFill term=bold cterm=bold ctermbg=0
hi TabLine ctermfg=Gray ctermbg=Black
hi TabLineSel ctermfg=White ctermbg=Black
hi Title ctermfg=Black ctermbg=Black

nnoremap :W<cr> :w<cr>
nnoremap <C-s> :w<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <A-h> :tabp<cr>
nnoremap <A-l> :tabn<cr>
