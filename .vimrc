" pathogen 
execute pathogen#infect()
" note : plugins used
"   nerdtree
"   supertab
"   syntastic
"   vim-sensible
"   mayansmoke
"   vim-airline
"   vim-airline-themes
"   powerline

syntax on
filetype plugin indent on

set mouse:a
set hlsearch
set clipboard=unnamedplus
set number
set cursorline

" tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" colors
set t_Co=256
set background=light
colorscheme mayansmoke 
hi Normal cterm=NONE ctermfg=16  ctermbg=254
hi CursorLine ctermfg=NONE ctermbg=252 cterm=NONE
hi Keyword ctermfg=91
hi Search ctermfg=255 ctermbg=94 cterm=NONE
hi Visual ctermfg=21 ctermbg=153 cterm=NONE
hi LineNr ctermfg=253 ctermbg=24 cterm=NONE

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" shortcut for JSON formating
nmap =j :%!python -m json.tool<CR>

" fonts 
let g:airline_powerline_fonts = 1
set encoding=utf-8
let g:airline_theme='cool'

