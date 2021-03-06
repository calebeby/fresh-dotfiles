set nocompatible

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echo "installing vim-plug"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" functionality
" Plug 'FredKSchott/CoVim'
" Plug 'jaxbot/github-issues.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': 'FZF' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'sbdchd/neoformat'
Plug 'radenling/vim-dispatch-neovim'
Plug 'alvan/vim-closetag'
Plug 'fatih/vim-go'
" Plug 'flowtype/vim-flow'

Plug 'joshdick/onedark.vim'

Plug 'vim-scripts/SyntaxAttr.vim'

" Plug 'neomake/neomake'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" completion
Plug 'jiangmiao/auto-pairs'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern', {'do': 'yarn'}

Plug 'guns/xterm-color-table.vim'

" text objects
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'

" theming
" Plug 'morhetz/gruvbox'

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'hhsnopek/vim-sugarss'

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:onedark_terminal_italics = 1

colorscheme onedark
" colorscheme caleb
" set background=dark

nnoremap <leader>t :botright 10 new <bar> call termopen('ava') <bar> startinsert<cr>
nnoremap <leader>T :botright 10 new <bar> call termopen('ava --watch') <bar> startinsert<cr>
nnoremap <leader>l :botright 10 new <bar> call termopen('xo --fix') <bar> startinsert<cr>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" open a new file in a new buffer
nmap <c-t> :FZF<cr>
vmap <c-t> <esc><c-t>gv
imap <c-t> <esc><c-t>
tmap <c-t> <esc><c-t>

" emmet
imap <c-b> <c-y>,

" quit
noremap <c-q> :xall<CR>

let mapleader = ","

" switch buffers without saving
set hidden

" use different indents in different filetypes
filetype plugin indent on

" tab characters are 2 wide
set tabstop=2

" when indenting with <>= use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab

" use syntax detection/highlighting
syntax enable

" reload files changed outside vim
set autoread

" save file
nmap <c-s> :up<CR>
vmap <c-s> <Esc>:up<CR>gv
imap <c-s> <Esc>:up<CR>a

" show relative numbers and current line on 0
set relativenumber number

" no arrow keys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" imap <up> <NOP>
" imap <down> <NOP>
" imap <left> <NOP>
" imap <right> <NOP>

" adjust numbers
noremap + <C-a>
noremap - <C-x>

" use system clipboard
" requires xsel
set clipboard=unnamedplus

" enable italic
let g:gruvbox_italic=1

" clear search by pressing <esc>
nnoremap <silent> <esc> :noh<return><esc>

" split right and below instead of left and up
set splitbelow
set splitright

" vertical split character
set fillchars=stl:―,stlnc:―,vert:│

nnoremap <m-j> <c-w><c-j>
nnoremap <m-k> <c-w><c-k>
nnoremap <m-l> <c-w><c-l>
nnoremap <m-h> <c-w><c-h>
nnoremap <m-h> <c-w><c-h>

" <esc> as <esc> in terminal
tmap <esc> <c-\><c-n>

" fix shortcuts in terminal
tmap <m-j> <esc><m-j>
tmap <m-k> <esc><m-k>
tmap <m-l> <esc><m-l>
tmap <m-h> <esc><m-h>

tmap <c-q> <esc><c-q>

" close FZF buffer with <esc>
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c><esc>:q<CR>

nnoremap gs :Gstatus<CR>
nnoremap gca :Gcommit -a<CR>
nnoremap gaa :Git add -A<CR>
nnoremap gp :Gpush<CR>

nnoremap <leader>r :source ~/.config/nvim/init.vim<CR>
nnoremap <c-n> :NERDTreeToggle<CR>

" change cursor shape on entering insert or replace mode
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

map -a	:call SyntaxAttr()<CR>

if exists('$TMUX')
  let &t_SI = "\ePtmux;\e" . &t_SI . "\e\\"
  let &t_EI = "\ePtmux;\e" . &t_EI . "\e\\"
endif

" ; === :
nnoremap ; :

" enter insert mode automatically in terminal buffers
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" read when changing buffers
au FocusGained,BufEnter * :silent! !

autocmd FileType javascript.jsx,javascript setlocal formatprg=prettier-eslint\ --stdin
let g:neoformat_try_formatprg = 1

" nmap <leader>f :Neoformat<cr>
nmap <leader>f :Dispatch! prettier-eslint --write %<cr>

" autocmd BufWritePre *.js Dispatch! prettier-eslint % --write

set mouse=a

augroup filetypedetect
  au BufRead,BufNewFile *.sgr setfiletype pug
  au BufRead,BufNewFile *.sml setfiletype pug
augroup END

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.js"
let g:go_def_mapping_enabled = 0
