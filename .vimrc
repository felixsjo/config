syntax enable
filetype plugin on
set background=dark
hi normal ctermbg=NONE
hi Tabline cterm=bold,reverse ctermbg=NONE ctermfg=white
hi TablineFill cterm=bold,reverse ctermbg=NONE ctermfg=white
hi TablineSel cterm=bold ctermbg=NONE ctermfg=white
hi visual cterm=bold ctermbg=darkred ctermfg=white

set autoindent
set backspace=indent,eol,start
set clipboard=unnamedplus
set hlsearch
set laststatus=2
set mouse=a
set nobackup
set nofixendofline
set noswapfile
set noundofile
set path+=**
set scrolloff=5
set splitbelow
set splitright
set wildignore=*.git/*,*.tags,tags,*.o,*.class
set wildignorecase
set wildmenu
set wildmode=longest,list:full
set wildcharm=<C-Z>

cnoremap <expr> <c-k> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <c-j> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <c-h> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <c-l> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

nnoremap <SPACE> <Nop>
let mapleader = " "

nnoremap <leader><leader> :noh<return><esc>
nnoremap :W<cr> :w<cr>
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
nnoremap <C-n> :silent! bnext<CR>
nnoremap <C-p> :silent! bprevious<CR>
nnoremap <leader>b :b <C-d>
nnoremap <leader>t :/\s\+$<cr>
nnoremap <leader>T :%s/\s\+$//g<cr>
nnoremap <leader>d :lcd %:p:h<cr>
nnoremap <leader>cc :call ToggleColorcolumn()<cr>
nnoremap <leader>R :w !sudo tee %<cr>
cnoremap <expr> * getcmdline() =~ '.*\*\*$' ? '/*' : '*'
cnoreabbr <expr> %% fnameescape(expand('%:p'))


imap kj <Esc>

vnoremap <C-h> <gv
vnoremap <C-l> >gv
vnoremap <C-j> :m'>+<CR>gv`<my`>mzgv`yo`z
vnoremap <C-k> :m'<-2<CR>gv`>my`<mzgv`yo`z

map <F1> :set number!<CR> :set relativenumber!<CR>

autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType c,cpp setlocal cindent cinoptions=:0,l1,t0,g0,(0
autocmd FileType diff setlocal ts=8
autocmd FileType rst setlocal ts=8 sw=8 sts=8 noet
autocmd FileType kconfig setlocal ts=8 sw=8 sts=8 noet
autocmd FileType dts setlocal ts=8 sw=8 sts=8 noet
autocmd FileType xml setlocal ts=2 sw=2 sts=2 noet

function! ToggleColorcolumn()
	if &colorcolumn
		setlocal colorcolumn=0
	else
		setlocal colorcolumn=80,132
	endif
endfunction
