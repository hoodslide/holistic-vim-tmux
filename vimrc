" SMH vimrc
"
" Only show cursorline for current window
" TURNED OFF until it's usable for bright color scheme
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" set nocursorline
set number

" http://usevim.com/2012/05/16/mouse/
set mouse=a
set ttymouse=xterm2

" Turn off middle-click paste for Thinkpad nipple scrolling: https://blog.teknik.io/tso/64
noremap <­MiddleMouse­> ""
noremap! <­MiddleMouse­> <Esc>
noremap <2-MiddleMouse> ""
noremap! <2-MiddleMouse> <Esc>
noremap <3-MiddleMouse> ""
noremap! <3-MiddleMouse> <Esc>
noremap <4-MiddleMouse> ""
noremap! <4-MiddleMouse> <Esc>

" scroll 2 lines at a time, instead of 3
nnoremap <ScrollWheelUp> <C-Y>
nnoremap <ScrollWheelDown> <C-E>
" inoremap <ScrollWheelUp> 2<C-Y>
" inoremap <ScrollWheelDown> 2<C-E>

set ai nolist nowrapscan ignorecase wrap
set softtabstop=2 tabstop=2 expandtab shiftwidth=2

" Clear screen on exit (tmux: yes, xterm-256color: no, because t_ti signal isn't supported)
" set t_ti=

" Performance - Don't do syntax hl parsing for super long lines
set synmaxcol=200

set tags=./.git/tags,~/ln/gems/tags;

" Need to call on initially to support git
filetype on
filetype off
set nocompatible

set shell=/bin/bash
set modelines=0
set spell spelllang=en_us
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

set textwidth=90
set formatoptions=qrn1

set nobackup
set noswapfile

" Disable Ex mode
map Q <ESC>

" Allow powerline fonts
let g:airline_powerline_fonts = 1

" Do syntax check when the buffer is first loaded
let g:syntastic_check_on_open=1

" Don't overindent javascript
let g:SimpleJsIndenter_BriefMode=1

" Hide .DS_Store and .git directories from Vim
let g:netrw_list_hide='.DS_Store,^\.git/$'

" Start neocompletecache automatically
let g:neocomplcache_enable_at_startup = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif

autocmd QuickFixCmdPost *grep* cwindow

" Syntastic shouldn't bother with HTML files
let g:syntastic_ignore_files=['.html$']

" Automatically format saved go files
autocmd FileType go autocmd BufWritePre <buffer> Fmt"

" NOT!!! Automatically open the error list when errors are detected
let g:syntastic_auto_loc_list=0

" Trailing whitespace sucks
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
