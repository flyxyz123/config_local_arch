" if without, nvim with no file will give error because it's not defined?
let fenc_bef = 0

" https://github.com/junegunn/vim-plug
call plug#begin()
" https://github.com/junegunn/fzf.vim#commands
" seems only need junegunn/fzf.vim, no need junegunn/fzf if already installed fzf with pacman
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" chriskempson/base16-vim doesn't do bold/italic for markdown syntax, and not maintained
" fnune/base16-vim and RRethy/nvim-base16 seem both work, both support tree-sitter
Plug 'fnune/base16-vim'
" nvim-treesitter does not support markdown right now, so wait
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" use latest vim-markdown
Plug 'tpope/vim-markdown'
" alternatives: h-hg/fcitx.nvim, rlue/vim-barbaric, lilydjwg/fcitx.vim
Plug 'rlue/vim-barbaric'
" alternatives: 'thinca/vim-ref' with 'eiiches/vim-ref-info', 'HiPhish/info.vim', 'alx741/vinfo'
Plug 'HiPhish/info.vim'
call plug#end()

" next line must put below `Plug 'glacambre/firenvim'`, else if click github issue textarea, then click elsewhere, then click textarea, textarea will not be selected (no cursor in it), not sure why
let g:firenvim_config = { 'localSettings': { '.*': { 'takeover': 'never' } } }

let g:infoprg = '/usr/bin/info'

" I use only one return for better readability
function Autocmd_set_fenc()
	" need to test &modifiable for gO
	if &modifiable && (&fileencoding != "utf-8")
		let l:fenc_bef = &fileencoding
		setlocal fileencoding=utf-8
		unsilent echom ":w to rewrite as utf-8"
		return l:fenc_bef
	else
		return &fileencoding
	endif
endfunction

" not fully understood augroup, recommanded in :help
" https://www.youtube.com/watch?v=dBBUOO1PRIU
augroup mycmd
	autocmd!
	" disable auto line break (tc) and insert comment (cro)
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=t
	" auto rewrite as utf-8 if not when :w
	" if use FileType *, nvim can't recognize some file extensions, ex: .csv
	autocmd BufRead * let fenc_bef = Autocmd_set_fenc()
	" similar to filetype.vim code, use setfiletype
	" .csx seems not c# but c# script file, this works tho
	" set syntax=cs also works
	autocmd BufNewFile,BufRead *.csx setfiletype cs
augroup END

" :h markdown, for vim default tpope/vim-markdown
"let g:markdown_folding = 1
let g:markdown_minlines = 1500
"let g:markdown_fenced_languages = ['python', 'sh', 'vim', 'c', 'cpp']

" netrw-p preview vertial split
let g:netrw_preview = 1
let g:netrw_winsize = 20

" seems needs this for autocmd FileType * to work? 
filetype plugin on

" fold is slow and buggy, at least for different kinds of vim-markdown, disable it, not sure if works or not
set nofoldenable

language en_US
set number relativenumber

" need next line for base16 colorscheme to work?
set termguicolors
colorscheme base16-tomorrow-night

" set dir to current editing file's dir 
set autochdir

" always use system for ALL instead of use + and * operator?
"set clipboard+=unnamedplus

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
if has('win32')
	set fileformats=dos
	" windows 10 bug, need this to change cursor back to vertical bar after leaving neovim
	" the number after ver seems no effects, maybe because neovim is exited
	" https://github.com/alacritty/alacritty/issues/2839#issuecomment-766421840
	" use of ! after autocmd see youtube video above, not fully understood
	autocmd! VimLeave * set guicursor=a:ver25
endif

" don't generate those three types of files
set nobackup
set noswapfile
set noundofile

" gg=G work for .xml files now,:h matchit-activate
" https://stackoverflow.com/questions/21408222/vim-indent-xml-file/28365920#28365920
packadd! matchit

" search case sensitive only if have uppercase
set ignorecase
set smartcase

" map ctrl+h/j/k/l to move between split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" moving in long line
nnoremap k gk
nnoremap j gj

nnoremap o o<Esc>
nnoremap O O<Esc>

" maybe useful if use mapleader in the future: https://www.slant.co/topics/7423/~which-key-works-best-as-vim-leader
" for searching command in manpages
map <leader>- /^ *-
map <leader>* /\*\*.*\*\*<CR>

" default statusline:set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline+=%<
set statusline+=%f          " %F or 1CTRL+G to show full path
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" below line doesn't work as expected, not sure why
"set statusline+=\ %{fenc_bef?fenc_bef:&fileencoding}
set statusline+=\ %{fenc_bef}
set statusline+=\ \[%{&fileformat}\]
set statusline+=\ %-10.(%l,%c%V%)
set statusline+=\ %P
