set nocompatible

let mapleader = " "

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

set ruler		" show the cursor position all the time
set number		" show line numbers
set relativenumber      " show relative line numbers
set numberwidth=5	" width of the number gutter
set noshowmode		" hide --INSERT-- in cmdline
set hls			" highlight search results
set splitbelow 		" open horizontal splits below
set splitright		" open vertical splits to the right
set backspace=indent,eol,start " backspace over everything in insert
set nobackup
set nowritebackup
set noswapfile
set history=200
set autoindent		" always have automatic indenting on
set shiftwidth=2
set smarttab
set expandtab		" spaces instead of tabs

syntax enable

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
colorscheme onehalflight

map <Leader>so :so ~/.vimrc<cr> " reload vimrc with so

" Tab mappings
map <Leader>tt :tabnew<cr>
map <Leader>tn :tabnext<cr>
map <Leader>tp :tabprevious<cr>

" Test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>
tmap <C-o> <C-\><C-n>
let test#strategy = "neovim"

" Ack mappings
" bind K to grep word under cursor
nnoremap K :Ack "<C-R><C-W>"<CR>
" bind K to grep selection
vnoremap K y:Ack "<C-r>""<CR>

" Say no to arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Turn mouse on
set mouse=a

syntax on
set textwidth=110	" set to rubocop length

" Set specific linters
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'ruby': ['standardrb'],
      \}

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

let g:ale_fixers = {'ruby': ['standardrb']}
let g:ale_fix_on_save = 1

let g:ruby_indent_assignment_style = 'variable'

" The Silver Searcher
if executable('ag')

  let g:ackprg = 'ag -Q --vimgrep'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -Q --follow -l --nocolor -g ""'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

endif 
