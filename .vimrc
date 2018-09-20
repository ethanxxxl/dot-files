set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This should be propogated onto the laptop

Plugin 'VundleVim/Vundle.vim'
"Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'valloric/youcompleteme'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'shirk/vim-gas'
"Plugin 'bling/vim-airline'
Plugin 'powerline/powerline'
Plugin 'Conque-GDB'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-monokai'
Plugin 'therubymug/vim-pyte'
Plugin 'tpope/vim-obsession'
Plugin 'tikhomirov/vim-glsl'
Plugin 'severin-lemaignan/vim-minimap'

call vundle#end()
filetype plugin indent on

set number
set relativenumber

set softtabstop=-1
set noexpandtab
set tabstop=4
set shiftwidth=4

set cursorline

set showtabline=2 " Always display the tabline, even if there is only one tab
set laststatus=2

set list
set listchars=tab:│\ ,extends:›,precedes:‹,nbsp:·,trail:·

syntax enable
set colorcolumn=80


set nowrap
set autoindent
set smartindent


set mouse=a

set foldmethod=syntax
set nofoldenable

set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=e
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12

" Highlights
highlight SpecialKey NONE
highlight Folded ctermbg=none ctermfg=Grey

highlight CursorLine cterm=NONE ctermbg=Black guibg=DarkGrey


" Mappings
let mapleader = ","
inoremap jk <esc>
nnoremap <Leader>w :wall<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>qq :qall<CR>
nnoremap <Leader>! :!q<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>s :shell<CR>
nnoremap J ddp
nnoremap K ddkP
nnoremap <Leader>tt :NERDTree<CR>
"noremap <silent>J m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
"noremap <silent>K m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
"noremap <silent><C-J> :set paste<CR>m`o<Esc>``:set nopaste<CR>
"noremap <silent><C-K> :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <Leader>ff :YcmCompleter FixIt<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l><C-l> :nohl<CR><C-l>

"Compile Mappings
set <S-F6>=^[[17;2~
nnoremap <F5> :call RunPython()<CR>
nnoremap <F6> :call CompileRun()<CR>
nnoremap <S-F6> :call CompileViewRun()<CR>
nnoremap <F7> :call RunAssembly()<CR>

" Others

let g:ycm_server_python_interpreter='/usr/bin/python2.7'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

"youcompleteme
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:completor_python_binary = '/usr/lib/python3.6/site-packagesk'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_completion = 0

"Functions

function RunAssembly()
	write
	silent !clear
	!nasm -f elf % && ld -m elf_i386 -s -o %:r %:r.o && ./%:r
	silent !rm -rf *.o
endfunction

function CompileRun()
	silent write
	silent !clear
	silent !make
	redraw!
	normal <CR>
	silent !gnome-terminal -x sh -c './run'
endfunction

function CompileViewRun()
	silent write
	silent !clear
	!make
	redraw!
	normal <CR>
	silent !gnome-terminal -x sh -c './run'
endfunction

function RunPython()
	write
	silent !clear
	!python3 %
	silent !clear
endfunction
