lua require('plugins')
lua require('config')
set completeopt=menu,menuone,noselect


if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors

" fixes glitch? in colors when using vim with tmux
set t_Co=256
set termguicolors
endif
syntax enable
colorscheme gruvbox8
set number colorcolumn=80
set tabstop=4 shiftwidth=4 softtabstop=0
set expandtab smarttab
set mouse=a
set swapfile directory=~/.nvim-swap/
set omnifunc=v:lua.vim.lsp.omnifunc

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox8'
let g:airline#extensions#tmuxline#enabled = 0

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
map <C-n> :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
