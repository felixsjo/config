call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
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

function! g:SimpleDark()
	colorscheme simple-dark-transparent
	hi Tabline cterm=bold,reverse ctermbg=NONE ctermfg=245
	hi TablineFill cterm=bold,reverse ctermbg=NONE ctermfg=245
	hi TablineSel cterm=bold ctermbg=NONE ctermfg=250
endfunction

syntax enable
filetype plugin on
set background=dark
"call g:SimpleDark()
colorscheme default
hi cursorline cterm=NONE ctermbg=black ctermfg=NONE
hi normal ctermbg=NONE
set hlsearch
hi Tabline cterm=bold,reverse ctermbg=NONE ctermfg=white
hi TablineFill cterm=bold,reverse ctermbg=NONE ctermfg=white
hi TablineSel cterm=bold ctermbg=NONE ctermfg=white

autocmd VimEnter * GitGutterDisable

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
nnoremap <leader>o :GFiles <cr>
nnoremap <leader>O :Files ~<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>g :Ag<cr>
nnoremap <leader>t :/\s\+$<cr>
nnoremap <leader>d :lcd %:p:h<cr>
nnoremap <leader>mdp :!pandoc -s -o /tmp/%:t:r.pdf %:p:r.md<CR> :!xdg-open /tmp/%:t:r.pdf<CR><CR>
nnoremap <leader>mdh :!pandoc -s -o /tmp/%:t:r.html %:p:r.md<CR> :!xdg-open /tmp/%:t:r.html<CR><CR>
nnoremap <leader>te :!rm /tmp/%:t:r.pdf<CR><CR>:!pandoc -s -o /tmp/%:t:r.pdf %:p:r.tex<CR> :!xdg-open /tmp/%:t:r.pdf<CR><CR>
nnoremap <leader>cc :call ToggleColorcolumn()<cr>
nnoremap <leader>t3 :call Tabs3()<cr>
nnoremap <leader>t4 :call Tabs4()<cr>
nnoremap <leader>t8 :call Tabs8()<cr>
nnoremap <leader>s3 :call Spaces3()<cr>
nnoremap <leader>s4 :call Spaces4()<cr>
nnoremap <leader>s8 :call Spaces8()<cr>
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
autocmd FileType c,cpp setlocal cindent cinoptions=:0,l1,t0,g0,(0
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

function! g:Tabs8()
	setlocal tabstop=8
	setlocal shiftwidth=8
	setlocal softtabstop=8
	setlocal textwidth=80
	setlocal noexpandtab

	setlocal cindent
	setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

function! g:Tabs3()
	setlocal tabstop=3
	setlocal shiftwidth=3
	setlocal softtabstop=3
	setlocal textwidth=80
	setlocal noexpandtab

	setlocal cindent
	setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

function! g:Tabs4()
	setlocal tabstop=4
	setlocal shiftwidth=4
	setlocal softtabstop=4
	setlocal textwidth=80
	setlocal noexpandtab

	setlocal cindent
	setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

function! g:Spaces8()
	setlocal tabstop=8
	setlocal shiftwidth=8
	setlocal softtabstop=8
	setlocal textwidth=80
	setlocal expandtab

	setlocal cindent
	setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

function! g:Spaces3()
	setlocal tabstop=3
	setlocal shiftwidth=3
	setlocal softtabstop=3
	setlocal textwidth=80
	setlocal expandtab

	setlocal cindent
	setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

function! g:Spaces4()
	setlocal tabstop=4
	setlocal shiftwidth=4
	setlocal softtabstop=4
	setlocal textwidth=80
	setlocal expandtab

	setlocal cindent
	setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

command! Tabs3 call g:Tabs3()
command! Tabs4 call g:Tabs4()
command! Tabs8 call g:Tabs8()
command! Spaces3 call g:Spaces3()
command! Spaces4 call g:Spaces4()
command! Spaces8 call g:Spaces8()
