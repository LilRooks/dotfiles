"First!
set nocompatible

" --- Vundle Bundle ---
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" --- Make Vim look good ---
Plugin 'altercation/vim-colors-solarized'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
" --- Vim as a programmer's text editor ---
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'itchyny/vim-haskell-indent'
Plugin 'matchit.zip'
" --- Git Sh!t ---
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

call vundle#end()

filetype plugin indent on

" --- General Settings ---

set backspace=indent,eol,start

set ruler
set number
set relativenumber
set showcmd
set incsearch
set hlsearch
set spelllang=en_US
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

syntax on

set mouse=a

"Need this for plugins like Syntastic and vim-gitgutter
" which put symbols in the sign column
hi clear SignColumn

" --- Plugin-Specific Settings ---

" --- altercation/vim-colors-solarized settings ---
" Toggle this to "light" for light colorscheme
set background=dark
" Uncomment the next line if terminal is not configured for solarized
"let g:solarized_termcolors=256
" Set the colorscheme
colorscheme solarized


" --- bling/vim-airline settings ---
" Always show statusbar
set laststatus=2
" Fancy arrow symbols, requires a patched font
" Uncomment the next line if installed
let g:airline_powerline_fonts = 1
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
" Use the solarized theme for the Airline status bar
let g:airline_theme='solarized'


" --- edkolev/tmuxline.vim settings ---
let g:airline#extensions#tmuxline#enabled = 0
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif


" --- jistr/vim-nerdtree-tabs settings ---
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
"let g:nerdtree_tabs_open_on_console_startup = 1


" --- scrooloose/syntastic settings ---
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END


" --- xolox/vim-easytags settings ---
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1


" --- majutsushi/tagbar settings ---
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)


" --- airblade/vim-gitgutter settings ---
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" --- Raimondi/delimitMate settings ---
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" --- plasticboy/vim-markdown ---
let g:vim_markdown_folding_disabled = 1

set pastetoggle=<F2>
map <F3> :setlocal spell!<CR>
