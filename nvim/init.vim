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
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
set nofixendofline
set hlsearch

function! g:SimpleDark()
	colorscheme simple-dark-transparent
	hi Tabline cterm=bold,reverse ctermbg=NONE ctermfg=white
	hi TablineFill cterm=bold,reverse ctermbg=NONE ctermfg=white
	hi TablineSel cterm=bold ctermbg=NONE ctermfg=white
	hi Search cterm=reverse ctermfg=gray ctermbg=NONE
	hi cursorline cterm=NONE ctermbg=black ctermfg=NONE
endfunction

syntax enable
filetype plugin on
set background=dark
"call g:SimpleDark()
colorscheme molokai
hi normal ctermbg=NONE
hi Tabline cterm=bold,reverse ctermbg=NONE ctermfg=white
hi TablineFill cterm=bold,reverse ctermbg=NONE ctermfg=white
hi TablineSel cterm=bold ctermbg=NONE ctermfg=white
hi cursorline cterm=NONE ctermbg=black ctermfg=NONE
hi SignColumn ctermbg=NONE
hi LineNr ctermbg=NONE
hi GitGutterAdd    ctermfg=2 ctermbg=NONE
hi GitGutterChange ctermfg=3 ctermbg=NONE
hi GitGutterDelete ctermfg=1 ctermbg=NONE

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
nnoremap <leader>s2 :call Spaces2()<cr>
nnoremap <leader>s3 :call Spaces3()<cr>
nnoremap <leader>s4 :call Spaces4()<cr>
nnoremap <leader>s8 :call Spaces8()<cr>
nnoremap <leader>R :w !sudo tee %<cr>
vnoremap <leader>i : !indent.sh<cr>

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

function! g:Spaces2()
	setlocal tabstop=2
	setlocal shiftwidth=2
	setlocal softtabstop=2
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
command! Spaces3 call g:Spaces2()
command! Spaces3 call g:Spaces3()
command! Spaces4 call g:Spaces4()
command! Spaces8 call g:Spaces8()

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  elseif (coc#rpc#ready())
"    call CocActionAsync('doHover')
"  else
"    execute '!' . &keywordprg . " " . expand('<cword>')
"  endif
"endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
