" SMH vimrc
"
" Only show cursorline for current window
" TURNED OFF until it's usable for bright color scheme
" augroup CursorLine
"   au!
"   au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"   au WinLeave * setlocal nocursorline
" augroup END
" set nocursorline

set nonumber

set mouse=a
set ttymouse=xterm2

set ai nolist nowrapscan ignorecase wrap
set softtabstop=2 tabstop=2 expandtab shiftwidth=2

" Clear screen on exit (tmux: yes, xterm-256color: no, because t_ti signal isn't supported)
" set t_ti=

" Performance - Don't do syntax hl parsing for super long lines
set synmaxcol=200

" set tags=./tags,./.git/tags,~/ln/gig/tags;

" Need to call on initially to support git
filetype on
filetype off
set nocompatible

set shell=/bin/bash
set modelines=0
set nospell spelllang=en_us
set autoread
syntax enable

" relative numbers (bleh!)
" set rnu

set encoding=utf-8

" number of context lines above and below
set scrolloff=0

" Automatically attempt to set the working directory to the current
" file. This value will be superceeded by rooter if it is installed
" set autochdir

set showmode

" Extra information about the command you're running in the status bar
set showcmd
set hidden

" Auto complete filenames when in :Ex mode, etc
set wildmenu
set wildmode=list:longest

" Ignore these thangs from Ctrl-P, Ag, CtrlSpace
set wildignore+=*/vendor/bundle/**

set novisualbell

" ttyfast implies you have a fast connection.  set notf if you're remote.
set ttyfast

" redraw screen if >3 lines are being scrolled
set ttyscroll=3

" Display the row and column of the cursor in the status line
set backspace=indent,eol,start

" Always show the status line
set laststatus=2

" Highlight search results
set nohlsearch

" Smart case searching. Case insensitive if all lowercase, but if you
" provide uppercase it will force matching case
set smartcase

" No incremental searches (searching while you type)
set noincsearch

" Visually display matching braces
set showmatch

set textwidth=120
set formatoptions=qrn1

set nobackup
set noswapfile

" Disable Ex mode
map Q <ESC>

" Don't overindent javascript
let g:SimpleJsIndenter_BriefMode=1

" Hide .DS_Store and .git directories from Vim
let g:netrw_list_hide='.DS_Store,^\.git/$'

" Start neocompletecache automatically
let g:neocomplcache_enable_at_startup = 1
autocmd QuickFixCmdPost *grep* cwindow

" Strip trailing whitespace on save
  function! <SID>StripTrailingWhitespaces()
      let l = line(".")
      let c = col(".")
      %s/\s\+$//e
      call cursor(l, c)
  endfun
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


" Show the quickfix window on TypeScript errors
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

source ~/.vim/vimrc.plugins
source ~/.vim/vimrc.keymap
source ~/.vim/vimrc.colors
