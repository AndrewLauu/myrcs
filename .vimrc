"----vim-plug settings-------
call plug#begin('~/.vim/plugged')
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joom/vim-commentary'
Plug 'honza/vim-snippets'

call plug#end()


"----vim settings------
" This must be first, because it changes other options as a side effect.
set nocompatible
set nocp "设置非兼容模式
let curpwd = getcwd()
" 定义快捷键的前缀，即<Leader>
let mapleader = "\<space>"

"----operate-----
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set mouse=a
set autoread
set updatetime=300 " Having longer updatetime (default is 4000 ms = 4s) leads to noticeable delays and poor user experience
set history=10 " keep 50 lines of command line history
set incsearch		" do incremental searching

"----ui-----
set number
set ruler		" show the cursor position all the time
set wildmenu
set wildmode=longest:list,full
" show status bar
set laststatus=2
set showcmd		" display incomplete commands
set t_Co=256
filetype indent plugin on
syntax on
set softtabstop=2
set wrap
set hlsearch
set signcolumn=yes

"----coding-----
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set encoding=utf-8
set langmenu=zh_CN.utf-8
" language message zh_CN.utf-8
set fileencoding=utf-8
set showmatch        " Show matching brackets.
" set paste
"----file-----
set undofile
" change dir
set backupdir=~/.vimtmp//,.
set directory=~/.vimtmp//,.
set undodir=~/.vimtmp/undodir


"----shortcut key-----
" 删除光标所在单词
" nmap <leader>D daw
nnoremap <leader>W :%s/\s\+$//g<CR>

" -----plugin settings-----

" -----cocPrettier-----
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

"----airline settings-------
let g:airline_powerline_fonts = 1 " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 "tab和buffer settings
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
"let g:airline#extensions#tabline#show_close_button = 0

let g:airline#section_b=''
let g:airline#section_x=''
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 配色
let g:airline_theme='molokai'
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" " let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = '❯'
" let g:airline_right_sep = '◀'
" let g:airline_right_alt_sep = '❮'
"let g:airline_symbols.linenr = '||'
"let g:airline_symbols.branch = '⎇'

" lightline
" let g:lightline = {'colorscheme': 'one',}
"let g:lightline#colorscheme = 'one'

" Prettier
" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

