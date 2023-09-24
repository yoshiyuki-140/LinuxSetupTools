" Configuration

" Import vim-plug file
" source /home/kuro/vim_plug_dir/Plugs_file.vim

" Auto execution
augroup vimrc
    autocmd!
    " <F5> key executions

    " Python file setting
    autocmd FileType python         nmap <buffer> <F5> gg :w <CR> :! python3 %<CR>

    " C,C++,Java common setting
    autocmd FileType c,cpp,java     set cindent
    autocmd FileType java           nmap <buffer> <F5> <UP> :w <CR> :! javac % <CR> <UP>:! java %< <CR>
    "autocmd FileType c              nmap <buffer> <F5> :w<CR> :! gcc -g -Wall -O2 -o %< %<CR>
    autocmd FileType c              nmap <buffer> <F5> :w<CR> :! gcc -g -o %< %<CR> 
    autocmd FileType c              nmap <buffer> <S-F5> :! ./%<<CR>
    " autocmd FileType c              imap { {}<LEFT>
    " autocmd FileType c              imap [ []<LEFT>
    " autocmd FileType c              imap ( ()<LEFT>
    autocmd FileType c              ClangFormatAutoEnable
    " autocmd FileType c              let g:clang_format#style_options = {
    "         \ "AccessModifierOffset" : -4,
    "         \ "AllowShortIfStatementsOnASingleLine" : "true",
    "         \ "AlwaysBreakTemplateDeclarations" : "true",
    "         \ "Standard" : "C++11"}

    autocmd FileType c,cpp            ClangFormatAutoEnable
    autocmd FileType c,cpp            nmap <buffer> <F5> :w <CR> :! g++ -g -o %< % <CR>
    autocmd FileType c,cpp            nmap <buffer> <S-F5> :! ./%< <CR>
    autocmd FileType c,cpp            call IoStream_cpp()

    " Sh script setting
    autocmd FileType sh             nmap <buffer> <F5> :w <CR>:!source % <CR>

    " Text file settings
    autocmd FileType text           set spell spelllang=en_us
    " autocmd FileType text           nmap <F5> :!notepad.exe % <CR>
    autocmd FileType text           nmap <leader>n :!notepad.exe % <CR>

    fu! Init_text()
        if line("$") == 1
            call append(0,"# This is text file")
            call append(1,"Booktitle: ,Auther: ,Level:")
        endif
    endfu
    autocmd FileType text           call Init_text()

    " Go language settings
    autocmd FileType go             nmap <buffer> <F5> :w <UP><CR> :! go run % <UP><CR>
    autocmd FileType go             nmap <buffer> <S-F5> :w <CR> :! go build -o %< % <CR>

    " vim script setting
    autocmd FileType vim            nmap <buffer> <F5> :w <CR> :source %<CR>

    " casl2 script init setting
    autocmd FileType cas            call Init_casl2()
    fu!     Init_casl2()
        if line("$") == 1
            call append(0,"SAMPLE   START")
            call append(1,"         RET")
            call append(2,"DATA     DC")
            call append(3,"         END")
        endif
    endfu

augroup END


" Pathogen first

"execute pathogen#infect()

" Change Leader key
let mapleader = "\<Space>"

" Basic Settings

filetype plugin indent on
syntax on
set helplang=ja
set guifont=:h12
set nocompatible
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=5
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
"set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set noundofile
"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nohlsearch 
nnoremap <tab> %
vnoremap <tab> %
" set nowrap
set wrap
set linebreak
set nolist
set dictionary+=/usr/share/dict/words
"set formatoptions=qrn1

"set colorcolumn=80

" Aesthetics

set background=light

" Mappings and shortcuts

" Basics

inoremap jj <ESC>
"imap <silent> nn \n
imap <silent> xx %

" Arrows are unvimlike 

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Miscellaneous 

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
au FocusLost * :wa
vnoremap . :norm.<CR>
" Leader shortcuts

nnoremap <leader>r :reg a<cr>
nnoremap <leader>R :reg <cr>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>d :read !date<CR>
nmap    <leader>U ggv$U <CR>
"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>ga :!git add .
nnoremap <leader>gs  :! git status
nnoremap <leader>gp :! git push
"nnoremap <leader>ft Vatzf
"nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>


"nnoremap <leader>q gqip
"nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
"nnoremap <leader>w <C-w>v<C-w>l
"nnoremap <leader>j VipJ
"nnoremap <leader>q gqip
"nnoremap <leader>f 1z=
"nnoremap <leader>s ]s
"nnoremap <leader>u :!git pull website master && git commit -am 'Standard commit.' && git push website master<CR><CR>
"nnoremap <leader>p :!git commit -am 'Standard commit.' && git push origin master<CR><CR>
"nnoremap <leader>r :!!<CR>
"nnoremap <leader>m :normal @a
"nnoremap <leader>l :CtrlP<CR>
nnoremap <leader>b  :%!xxd
nmap <leader>gg     gg=G''
nnoremap <leader>s :set spell!<CR>
"nnoremap <leader>n :set nonumber!<CR>
"nnoremap <leader>rn :set norelativenumber!<CR>
"nnoremap <leader>c :nohl<CR>
"nnoremap <leader>pa :set nopaste!<CR>
"nnoremap <leader>rc :so $MYVIMRC<CR>
"nnoremap <leader>b :BlogSave publish<CR>
"nnoremap <leader>h :set ft=HTML<CR><CR>

"Control shortcuts

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
colorscheme ron
