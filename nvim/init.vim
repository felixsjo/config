call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'do': './install --bin' }
	Plug 'junegunn/fzf.vim'
  Plug 'preservim/nerdtree'
  "Plug 'vim-airline/vim-airline'
call plug#end()

set shellcmdflag=-c
set showmode
set encoding=utf-8
set shortmess+=I
set mouse=a
set nonumber
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set laststatus=2
"set autochdir
set noswapfile
set nobackup
set noundofile
set scrolloff=5
set visualbell
set cursorline
set clipboard=unnamedplus
set omnifunc=syntaxcomplete#Complete
set splitright
set splitbelow
set wildmenu
set wildmode=longest,full
set path+=**

syntax enable
filetype plugin on
set background=dark
colorscheme delek

let g:NERDTreeHijackNetrw = 1

"let g:airline#extensions#tabline#enabled = 1

nnoremap <SPACE> <Nop>
let mapleader = " "

nnoremap <leader><leader> :noh<return><esc>

nnoremap :W<cr> :w<cr>
nnoremap <C-s> :w<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-n> :tabp<CR> 
nnoremap <C-m> :tabn<CR> 

nnoremap <leader>p :Files<cr>
nnoremap <leader>P :Files ~<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>g :Ag<cr>

nnoremap <leader>f :NERDTreeToggle<cr>

"" save and convert active markdown file to pdf and then open it
nnoremap <leader>md :w <CR> :!pandoc -s -o %:r.pdf %:r.md<CR> :!xdg-open %:r.pdf<CR><CR>

imap kj <Esc>

map <F1> :set number!<CR> :set relativenumber!<CR>
set pastetoggle=<F3>
map <F4> :set list!<CR>
map <F5> :set cursorline!<CR>
map <F7> :set spell!<CR>

set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
"set statusline+=%F
"set statusline=%f%m%r%h%w\ 
"set statusline+=[%{&ff}]
"set statusline+=%=
"set statusline+=[\%03.3b/\%02.2B]\ [POS=%04v]

