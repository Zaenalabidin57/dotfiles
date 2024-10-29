" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
"
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

"colorscheme koehler
set clipboard=unnamedplus

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)
"


call plug#begin()
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'vim-airline/vim-airline'
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'junegunn/fzf.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'vimsence/vimsence'
Plug 'ap/vim-buftabline'
Plug 'mattn/emmet-vim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
call plug#end()





" warna catppuccin
let g:lightline = {'colorscheme': 'catppuccin_mocha'}
let g:airline_theme = 'catppuccin_mocha'


" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"set codeium"
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <script><silent><nowait><expr> <C-h> codeium#AcceptNextWord()
imap <script><silent><nowait><expr> <C-j> codeium#AcceptNextLine()
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>

nnoremap <silent> <leader>c :call codeium#chat()<CR>

let g:codeium_workspace_root_hints = ['.bzr','.git','.hg','.svn','_FOSSIL_','package.json']
" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
 let mapleader = " "
 nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"set session
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "yes"
let g:session_autosave_periodic = 2
let g:session_autosave_silent = 1
let g:session_default_name = "sesi "


nnoremap <leader>ss :SaveSession 
nnoremap <leader>so :OpenSession<CR>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"set fzf desuwa
nnoremap <silent> <leader>fo :History<CR>
nnoremap <silent> <leader>fl :Lines<CR>
nnoremap <silent> <leader>ft :Tags<CR>
nnoremap <silent> <leader>fb :Buffers<CR>

"Set Termgui colors
set termguicolors

autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE

" Security
set modelines=0

" Show line numbers
set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr>
" clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts
"

" remap : desuwa
nnoremap ; :

" remap buffer

nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" remap terminal
map <leader>h :term<CR>

"no highlighting
nnoremap <Esc> :noh<CR>

" Formatting
map <leader>q gqip

" mouse
set mouse=a

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default: set list " To enable by default Or use
" your leader key + l to toggle on/off
map <leader>l :set list!<CR>
" Toggle tabs and EOL

" Color scheme (terminal)
"set t_Co=256
"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
colorscheme catppuccin_macchiato


