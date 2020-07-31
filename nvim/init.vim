call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/clearsilver'
"Plug 'vivien/vim-linux-coding-style'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/c.vim'
"Plug 'vim-airline/vim-airline'
call plug#end()

set shellcmdflag=-c
set showmode
set encoding=utf-8
set shortmess+=I
set mouse=a
set nonumber
set backspace=indent,eol,start
set autoindent
set laststatus=2
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
set hlsearch

syntax enable
filetype plugin on
set background=dark
colorscheme solarized

hi Tabline cterm=NONE
hi TablineFill cterm=NONE
hi TablineSel cterm=NONE ctermbg=gray ctermfg=black
hi SignColumn ctermbg=black
hi GitGutterAdd ctermbg=black
hi GitGutterChange ctermbg=black
hi GitGutterDelete ctermbg=black

let g:NERDTreeHijackNetrw = 1

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
nnoremap <leader>t :/\s\+$<cr>
nnoremap <leader>d :lcd %:p:h<cr>
nnoremap <leader>mdp :!pandoc -s -o /tmp/%:t:r.pdf %:p:r.md<CR> :!xdg-open /tmp/%:t:r.pdf<CR><CR>
nnoremap <leader>mdh :!pandoc -s -o /tmp/%:t:r.html %:p:r.md<CR> :!xdg-open /tmp/%:t:r.html<CR><CR>

imap kj <Esc>

"" move blocks left, right, down, up
vnoremap <A-h> <gv
vnoremap <A-l> >gv
vnoremap <A-j> :m'>+<CR>gv`<my`>mzgv`yo`z
vnoremap <A-k> :m'<-2<CR>gv`>my`<mzgv`yo`z

map <F1> :set number!<CR> :set relativenumber!<CR>
set pastetoggle=<F3>

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType c,cpp call s:LinuxFormatting()
autocmd FileType diff setlocal ts=8
autocmd FileType rst setlocal ts=8 sw=8 sts=8 noet
autocmd FileType kconfig setlocal ts=8 sw=8 sts=8 noet
autocmd FileType dts setlocal ts=8 sw=8 sts=8 noet

function s:LinuxFormatting()
	setlocal tabstop=8
	setlocal shiftwidth=8
	setlocal softtabstop=8
	setlocal textwidth=80
	setlocal noexpandtab

	setlocal cindent
	setlocal cinoptions=:0,l1,t0,g0,(0
endfunction
