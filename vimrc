if has("syntax")
    syntax on
    color hilal
endif

set t_Co=256
filetype plugin on
filetype indent on

set nowrap              " Prevent wrapping of too long lines
set showmatch	      	" Show matching brackets.
set smartcase	     	" Do smart case matching
set incsearch	     	" Incremental search
set hlsearch            " Highlight search results
set number              " Show line Numbers
set noruler             " Show current line
set expandtab           " Expand tabs to spaces
set autoindent          " Keeps identaion when pressing carriage return
set smartindent         " Automatically indents text

set laststatus=2        " Permanently show status line
set shiftwidth=4        " Indentation used by shiftkeys
set softtabstop=4       " How many columns vim add then you are hitting the tab key
set tabstop=4           " Defines how many spaces build one tab
set numberwidth=1       " Horizontal offset of linenumbers
set foldmethod=marker   " Created folds by markert {{{}}}
set conceallevel=3      " Set a high conceal level

:set statusline=%F                         " Path of the file
:set statusline+=\ %y                      " Type of the file
:set statusline+=%=                        " Switch to the right side
:set statusline+=%c                        " Current column
:set statusline+=/                         " Separator  
:set statusline+=%{len(getline('.'))}      " total colmuns
:set statusline+=\ \ \ %l                  " Current line
:set statusline+=/                         " Separator
:set statusline+=%L                        " Total lines 

let mapleader = "-"       " Own mappings begin with -
let maplocalleader = '\'  " Local mappings begin with \

" Change case of the current word
nnoremap ~ viw"_y~e                                                     
" Always use very-magic serach (full regex)
nnoremap / /\v
" Open NERDTree
nnoremap <leader><cr> :NERDTree<cr>
" Start a fzf search
nnoremap <leader><leader> :Files<cr>
" Delete current search (useful to get rid of highlithing)
nnoremap <leader>d/ :let @/=""<cr>
" Display trailing spaces as errors
nnoremap <leader>w :match Error /\v +$/<cr>
" Remove trailing spaces from the whole file
nnoremap <leader>W :%s/\v +$//<cr>
" Open .vimrc in a vsplit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source .vimrc again
nnoremap <leader>sv :source $MYVIMRC<cr>
" Resize the current window
nnoremap <leader>< <c-w>>
nnoremap <leader>y <c-w><
" Enclose the current word in double/single quotes
nnoremap <leader>" viw<esc>a"<esc>hviwo<esc>i"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hviwo<esc>i'<esc>lel
" Show syntax groups of the current word
nnoremap <leader>ss :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") ."> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" Disable arrorw keys in normal mode
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
" Disable arrorw keys in visual mode
vnoremap <Left> <nop>
vnoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
" Disable arrorw keys in insert mode
inoremap <Left> <nop>
inoremap <Down> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>

augroup filetype_cpp
    autocmd!
    autocmd Filetype cpp setlocal expandtab
    autocmd Filetype cpp setlocal smartindent
    autocmd FileType cpp setlocal shiftwidth=4
    autocmd FileType cpp setlocal softtabstop=4
    autocmd BufNewFile *.cpp execute "normal i#include<stdio.h>\r#include<stdlib.h>\r#include<string.h>\r\r\rint main() {\r\r}"
augroup END

augroup filetype_c
    autocmd!
    autocmd Filetype c setlocal expandtab
    autocmd Filetype c setlocal smartindent
    autocmd FileType c setlocal shiftwidth=4
    autocmd FileType c setlocal softtabstop=4
    autocmd BufNewFile *.c execute "normal i#include<stdio.h>\r#include<stdlib.h>\r#include<string.h>\r\r\rint main() {\r\r}"
augroup END

augroup filetype_html
    autocmd!
    autocmd FileType html setlocal expandtab
    autocmd Filetype html setlocal smartindent
    autocmd FileType html setlocal shiftwidth=4
    autocmd FileType html setlocal softtabstop=4
    autocmd BufNewFile *.html execute "normal i<html>\r  <head>\r</head>\r<body>\r</body>\r</html>"
augroup END

augroup filetype_tex
    autocmd!
    autocmd FileType tex setlocal expandtab
    autocmd Filetype tex setlocal shiftwidth=4
    autocmd Filetype tex setlocal softtabstop=4
    autocmd Filetype tex setlocal conceallevel=2
    autocmd Filetype tex syntax match Conceal /\v\\textbackslash\{\}/ containedin=texStatement,texItalStyle,texItalBoldStyle conceal cchar=\
    autocmd Filetype tex syntax match Conceal /\v\\_/ containedin=texStatement,texItalStyle,texItalBoldStyle conceal cchar=_
augroup END

augroup filetype_sh
    autocmd!
    autocmd FileType sh setlocal expandtab
    autocmd FileType sh setlocal shiftwidth=4
    autocmd FileType sh setlocal softtabstop=4
    autocmd BufNewFile *.sh execute "normal i#!/bin/bash\r\r"
augroup END

augroup filetype_php
    autocmd!
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal shiftwidth=4
    autocmd FileType php setlocal softtabstop=4
    autocmd BufNewFile *.php execute "normal i<?php ?>"
augroup END 
  
augroup filetype_python
    autocmd!
    autocmd FileType python setlocal expandtab
    autocmd FileType python setlocal smartindent
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal softtabstop=4
    autocmd BufNewFile *.py execute "normal i#!/usr/bin/env python3"
augroup END

augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal expandtab
    autocmd FileType markdown setlocal smartindent
    autocmd FileType markdown setlocal shiftwidth=2
    autocmd FileType markdown setlocal softtabstop=2
augroup END
  
" Recognize .tex files always as latex:
let g:tex_flavor='latex'

" Avoid some common typos
ab tetxit textit
ab tetxbf textbf
ab teh the

let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['python', 'java', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
