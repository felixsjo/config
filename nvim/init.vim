call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'cocopon/iceberg.vim'
Plug 'Lokaltog/vim-monotone'
Plug 'vim-scripts/clearsilver'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/c.vim'
Plug 'tek256/simple-dark'
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
set splitright
set splitbelow
set wildmenu
set wildmode=longest,full

syntax enable
filetype plugin on
set background=dark
colorscheme simple-dark-transparent
set hlsearch
"hi normal ctermbg=NONE

hi Tabline cterm=NONE ctermbg=black ctermfg=white
hi TablineFill cterm=NONE ctermbg=black
hi TablineSel cterm=reverse ctermbg=black ctermfg=white
"hi SignColumn ctermbg=black
"hi GitGutterAdd ctermbg=black
"hi GitGutterChange ctermbg=black
"hi GitGutterDelete ctermbg=black

"let g:NERDTreeHijackNetrw = 1

nnoremap <SPACE> <Nop>
let mapleader = " "

let g:gitgutter_map_keys = 0

nnoremap <leader><leader> :noh<return><esc>
nnoremap :W<cr> :w<cr>
nnoremap <C-s> :w<cr>
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>H <C-w>H
nnoremap <leader>L <C-w>L
nnoremap <C-Down> <C-w>+
nnoremap <C-Up> <C-w>-
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <leader>w <C-w>w
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <leader>p :Files<cr>
nnoremap <leader>P :Files %:p:h<cr>
nnoremap <leader>o :Files ~<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>g :Ag<cr>
nnoremap <leader>f :NERDTreeToggle<cr>
nnoremap <leader>t :/\s\+$<cr>
nnoremap <leader>d :lcd %:p:h<cr>
nnoremap <leader>mdp :!pandoc -s -o /tmp/%:t:r.pdf %:p:r.md<CR> :!xdg-open /tmp/%:t:r.pdf<CR><CR>
nnoremap <leader>mdh :!pandoc -s -o /tmp/%:t:r.html %:p:r.md<CR> :!xdg-open /tmp/%:t:r.html<CR><CR>
nnoremap <leader>cc :call ToggleColorcolumn()<cr>
vnoremap <leader>i : !indent<cr>

imap kj <Esc>

"" move blocks left, right, down, up
vnoremap <C-h> <gv
vnoremap <C-l> >gv
vnoremap <C-j> :m'>+<CR>gv`<my`>mzgv`yo`z
vnoremap <C-k> :m'<-2<CR>gv`>my`<mzgv`yo`z

map <F1> :set number!<CR> :set relativenumber!<CR>
map <F2> :GitGutterToggle<CR>

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType c,cpp call g:LinuxFormat()
autocmd FileType diff setlocal ts=8
autocmd FileType rst setlocal ts=8 sw=8 sts=8 noet
autocmd FileType kconfig setlocal ts=8 sw=8 sts=8 noet
autocmd FileType dts setlocal ts=8 sw=8 sts=8 noet

function! ToggleColorcolumn()
	if &colorcolumn
		setlocal colorcolumn=0
	else
		setlocal colorcolumn=80,132
	endif
endfunction

function! g:LinuxFormat()
	setlocal tabstop=8
	setlocal shiftwidth=8
	setlocal softtabstop=8
	setlocal textwidth=80
	setlocal noexpandtab

	setlocal cindent
	setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

function! g:Format3()
	setlocal tabstop=3
	setlocal shiftwidth=3
	setlocal softtabstop=3
	setlocal textwidth=80
	setlocal noexpandtab

	setlocal cindent
	setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

function! g:Format4()
	setlocal tabstop=4
	setlocal shiftwidth=4
	setlocal softtabstop=4
	setlocal textwidth=80
	setlocal noexpandtab

	setlocal cindent
	setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

command! LinuxFormat call g:LinuxFormat()
command! Format3 call g:Format3()
command! Format4 call g:Format4()
