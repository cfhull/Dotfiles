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

if &t_Co > 2 || has("gui_running")
	syntax on
	colorscheme jellybeans 
	set hlsearch
endif

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
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Disables arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Cursor shapes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'vim-syntastic/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ajh17/VimCompletesMe'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ruanyl/vim-fixmyjs'
Plug 'junegunn/vim-emoji'

call plug#end()

" Powerline settings
set laststatus=2

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5

let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_enable_balloons = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
