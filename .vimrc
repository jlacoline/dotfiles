execute pathogen#infect()
" plugins used
"   ansible-vim
"   mayansmoke
"   syntastic
"   vim-go
"   ctrlp.vim
"   mediawiki.vim
"   vim256-color
"   vim-hug-neovim-rpc
"   deoplete-jedi
"   nerdtree
"   vim-airline
"   vim-rego
"   deoplete.nvim
"   nvim-yarp
"   vim-airline-themes
"   vim-tmux-navigator
"   markdown-preview.vim
"   python-mode
"   vim-fugitive
"   vim-yaml

syntax on
filetype plugin indent on
set autoread
set encoding=utf-8
set mouse:a
set hlsearch
set clipboard=unnamedplus
set number
set cursorline
set splitright

" tabs
set expandtab
set autoindent
set shiftwidth=2
set softtabstop=2

" colors
set t_Co=256
set background=light
colorscheme mayansmoke
hi Normal cterm=NONE ctermfg=16  ctermbg=254
hi CursorLine ctermfg=NONE ctermbg=252 cterm=NONE
hi Keyword ctermfg=91
hi Constant ctermfg=202
hi Search ctermfg=255 ctermbg=94 cterm=NONE
hi Visual ctermfg=21 ctermbg=153 cterm=NONE
hi LineNr ctermfg=253 ctermbg=24 cterm=NONE

" nerdtree
" close nerdtree if last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" hide some python files
let NERDTreeIgnore = ['__pycache__', '__init__.py']

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_python_python_exec = '/usr/bin/python3'
"let g:syntastic_python_flake8_exec = '/usr/bin/python3'
"let g:syntastic_python_pep8_exec = '/usr/bin/python3'
let g:syntastic_python_checkers=['flake8']

" python mode
"let g:syntastic_ignore_files = ['\.py$']
"let g:pymode_python = 'python3'
let g:pymode_lint = 0
let g:pymode_folding = 0
"set foldlevel=99 " folds opened by default
let g:pymode_rope = 0
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_rope_lookup_project = 0

" from http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" shortcut for JSON formating
nmap =j :%!python -m json.tool<CR>

" fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='cool'

" multiple cursors plugin
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-g>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" shortcut for "set paste"
set pastetoggle=<F2>

" show hidden files in ctrlp
let g:ctrlp_show_hidden = 1

" tmux navigator
let g:tmux_navigator_disable_when_zoomed = 1

" https://thoughtbot.com/blog/faster-grepping-in-vim
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" grep opens a new tab
command! -nargs=1 Grep execute "tabnew | grep <args> | cw"

" ansible-vim
au BufRead,BufNewFile *.yml.j2 set filetype=yaml.jinja2

" syntastic go linter
let g:syntastic_go_checkers=['golint']

" Use deoplete.
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" yaml indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>

" shortcut for removing trailing spaces
:nnoremap <silent> <F3> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" markdown preview
let g:mkdp_auto_close = 0
