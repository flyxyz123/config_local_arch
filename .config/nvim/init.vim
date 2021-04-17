" if without, nvim with no file will give error because it's not defined?
let fenc_bef = "none" 

function Autocmd_set_fenc()
	let fenc_bef = &fileencoding
	if &fileencoding != "utf-8"
		setlocal fileencoding=utf-8
		unsilent echom ":w to rewrite as utf-8"
	endif
	return fenc_bef
endfunction

" en_US intro
language en_US

" hybrid number numbers
set number relativenumber

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
"set expandtab       " tabs are space

" https://www.zhihu.com/question/22363620/answer/21199296
" last line seems is default to neovim but not vim 
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set encoding=utf-8

" some file on win10 display as unix but is dos
if has("win32")
	set fileformats=dos
endif

" don't generate those three types of files
set nobackup
set noswapfile
set noundofile

" set dir to current editing file's dir 
set autochdir

" vim-plug
"call plug#begin()
"Plug 'preservim/nerdtree'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'vim-airline/vim-airline' 
"call plug#end()

" map ctrl+h/j/k/l to move between split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" search case sensitive only if have uppercase
set ignorecase
set smartcase

" default statusline:set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline+=%<
set statusline+=%f          " %F or 1CTRL+G to show full path
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\ %{&fileencoding}
set statusline+=\ %{fenc_bef}
set statusline+=\ \[%{&fileformat}\]
set statusline+=\ %-10.(%l,%c%V%)
set statusline+=\ %P

" moving in long line
nnoremap k gk
nnoremap j gj

filetype plugin on  " seems needs this for autocmd FileType * to work? 
" disable auto line break (tc) and insert comment (cro)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=t
" auto rewrite as utf-8 if not when :w
autocmd FileType * let fenc_bef = Autocmd_set_fenc()

" always use system for ALL instead of use + and * operator?
"set clipboard+=unnamedplus
