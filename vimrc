set nocompatible

call pathogen#infect()

let mapleader=","

let g:ctrlp_extensions = ["tag"]
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 100
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux

let macvim_skip_colorscheme = 1 " prevent MacVim from applying own color scheme

set shell=bash

filetype plugin indent on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


syntax on
set textwidth=80
set encoding=utf-8
set hlsearch
set incsearch
set number
set nowrap
set smartcase
set showmode
set visualbell
set t_vb=

set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab

set laststatus=2

" Set the color scheme
set t_Co=256 " 256 colors
colorscheme solarized
set background=light

" Better :sign interface symbols
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '!'

" Switch to previous buffer
nnoremap <leader><leader> <c-^>

" Easy split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" enable rainbow parentheses for all file types
let g:rainbow_active = 1


" ------------------
" Other languages
" ------------------
autocmd BufNewFile,BufRead *.agda set filetype=agda
autocmd BufNewFile,BufRead *.idr set filetype=idris
autocmd BufNewFile,BufRead *.ocaml set filetype=ocaml
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.pure set filetype=pure
autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.ll set filetype=llvm

" ------------------
" C
" ------------------
autocmd BufEnter *.c set formatprg=astyle\ --style=1tbs
autocmd BufEnter *.c compiler splint
autocmd BufWritePre *.c :%s/\s\+$//e

" ------------------
" Haskell
" ------------------
let g:ctrlp_custom_ignore = '\v[\/]static$'

set wildignore+=*.o
set wildignore+=*.hi
set wildignore+=*.chi

au FileType cabal setl et ts=2 sw=2 sts=2
au Bufread,BufNewFile *.hsc set filetype=haskell

let g:haskell_conceal_wide = 1

autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd BufWritePost *.hs GhcModCheckAsync

au FileType haskell nnoremap <leader>t :GhcModType<cr>
au FileType haskell nnoremap <leader>T :GhcModTypeInsert<cr>
au FileType haskell nnoremap <leader>c :GhcModLintAsync<cr>

let g:ycm_semantic_triggers = {'haskell' : ['.']}
