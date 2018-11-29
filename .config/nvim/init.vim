set nocompatible
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete

if has("vms")
	set nobackup
else
	set backup
	set undofile
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

if has('mouse')
	set mouse=a
endif
set t_Co=256
syntax on
set hlsearch

if has("autocmd")
	filetype plugin indent on

	augroup vimrcEx
		au!
		autocmd FileType text setlocal textwidth=78
		autocmd BufReadPost *
					\ if line("'\"") >= 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif
	augroup END
else
	set autoindent		" always set autoindenting on
endif " has("autocmd")

if has('langmap') && exists('+langnoremap')
	" Prevent that the langmap option applies to characters that result from a
	" mapping.  If unset (default), this may break plugins (but it's backward
	" compatible).
	set langnoremap
endif

" sets swp and ~ files to be created inside the .vim/tmp folder
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set undodir=~/.vim/tmp
set cursorline
set number
set tabstop=2 softtabstop=0 shiftwidth=2 expandtab copyindent preserveindent

set wildmenu
" ignores files from fuzzy search
set wildignore+=node_modules/*,bower_components/*

" Disables arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Cursor shapes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

cmap W w !sudo tee % > /dev/null

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

nnoremap <F2> :call ToggleLocList()<cr>
let g:list_close = 1
function! ToggleLocList()
	if g:list_close
		lopen
		let g:list_close = 0
	else
		lclose
		let g:list_close = 1
	endif
endfunction

"ale settings
let g:airline#extensions#ale#enabled = 1
let b:ale_fixers = {'javascript': ['eslint']}
let g:ale_sign_column_always = 1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

colors jellybeans
