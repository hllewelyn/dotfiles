set nocompatible

let mapleader = " "

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

set autoread            " automatically reload if file changes outside of vim
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
set scrolloff=3         " start scrolling 5 lines before edge of viewport
set clipboard+=unnamedplus

" Change the color of the editor after 120 chars, except for the quickfix panel.
let &colorcolumn=join(range(121,999),",")
au FileType qf setlocal nonumber colorcolumn=

syntax enable

" Folding
set foldlevel=1
set foldmethod=syntax

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
colorscheme onehalflight

" Shortcut commands to change the colorscheme - mainly used for pairing
command! DD execute "colorscheme onehalfdark"
command! DL execute "colorscheme onehalflight"

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

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fk <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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

let g:ale_fixers = {'ruby': ['standardrb'], 'javascript': ['prettier']}
let g:ale_fix_on_save = 1

let g:ruby_indent_assignment_style = 'variable'

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup MISC
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END
