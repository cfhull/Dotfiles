set nocompatible

set termguicolors
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

filetype plugin indent on

" sets swp and ~ files to be created inside the .vim/tmp folder
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set undodir=~/.vim/tmp
set cursorline
set number
set tabstop=2 softtabstop=0 shiftwidth=2 expandtab copyindent preserveindent

set wildmode=full
set wildmenu
" ignores files from fuzzy search
set wildignore+=node_modules/*,bower_components/*

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Cursor shapes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/jspc.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

autocmd FileType json syntax match Comment +\/\/.\+$+

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


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

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

colors jellybeans

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

set foldlevel=99

let g:netrw_banner = 0

command! Source so ~/.config/nvim/init.vim

"-------------------
"----- Coc.vim -----
"-------------------

let g:coc_global_extensions = [
\ 'coc-highlight',
\ 'JavaScriptSnippets',
\ 'coc-snippets',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-yaml',
\ 'coc-stylelint',
\ 'coc-json',
\ 'coc-css',
\ 'coc-tsserver']

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
