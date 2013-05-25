" Jan Zwiener's vimrc
" ===================
" jan@zwiener.org

" PATHOGEN
" --------

" Pathogen init: load all plugins from bundle/ directory
execute pathogen#infect()
syntax on
if version>600
    filetype plugin indent on
else
    filetype on
endif

" Essential
" ---------

" Leave input mode with jj - much faster than reaching for the esc key and only
" very rarely a hurdle.
inoremap jj <Esc>
" Set <leader> to ,
let mapleader = ","
let g:mapleader = ","
" Easy half-page scrolling with <space>
nnoremap <Space> <C-d>
nnoremap <S-Space> <C-u>
" Support this in visual-mode
vnoremap <Space> <C-d>
vnoremap <S-Space> <C-u>
" Remove search highlighting with <enter>
nnoremap <CR> :noh<CR>

" MY VIM SETTINGS
" ---------------

" many years of working with Windows:
behave mswin
" Just to be sure:
" <behave mswin>
set mousemodel=popup          " right mouse button pups up a menu
set selectmode=mouse,key      " select text with the mouse or with Shift+cursor keys
set keymodel=startsel,stopsel " shift starts the sel-mode, any other key stops it
" </behave mswin>
"Vim won't become the owner of the windowing system's global selection:
set guioptions-=aA
set backspace=indent,eol,start " backspace wrap to previous/next line
set whichwrap+=<,>,[,]         " cursor left/right to move to the previous/next line
" Clipboard settings, unnamedplus is useful for X-Windows
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif
" Complete options (disable preview window)
set completeopt=menu,menuone,longest
" Limit the number of items to 15 in the completion popup menu
set pumheight=15
" Select empty areas with visual block mode
set virtualedit=block
" match paren is slow (e. g. in large latex code)
" let loaded_matchparen = 1
" set noshowmatch

" Common vim stuff
set linebreak        " if on Vim will wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen.
set ignorecase       " If the 'ignorecase' option is on, the case of normal letters is ignored.
set smartcase        " case insensitive searches become sensitive with capitals
set hidden           " edit multiple buffers without saving the modifications made to a buffer
set autoindent       " copy indent from current line when starting a new line
set tabstop=4        " number of spaces that a <Tab> in the file counts for.
set shiftwidth=4     " number of spaces to use for each step of (auto)indent. when zero the 'ts' value will be used.
set shiftround       " Round indent to multiple of 'shiftwidth'.  Applies to > and < commands.
set scrolloff=5      " Minimal number of screen lines to keep above and below the cursor.
set sidescrolloff=10 " The minimal number of screen columns to keep to the left and to the right of the cursor
set ffs=unix,dos     " This gives the end-of-line (<EOL>) formats that will be tried when starting to edit a new buffer and when reading a file into an existing buffer
set smarttab         " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.  'ts' or 'sts' else.  A <BS> will delete a 'shiftwidth' worth of space at the start of the line.
set number           " precede each line with its line number
set showbreak=>      " String to put at the start of lines that have been wrapped.
set showmode         " If in Insert, Replace or Visual mode put a message on the last line.
set autoread         " if the file has changed outside, but was not modified in vim: reload
set autowrite        " Automatically save before commands like :next and :make
set hlsearch         " When there is a previous search pattern, highlight all its matches.
set incsearch        " While typing a search command, show where the pattern, as it was typed so far, matches.
set wildmenu         " When 'wildmenu' is on, command-line completion operates in an enhanced mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
set wildchar=<Tab>   " Character you have to type to start wildcard expansion in the command-line, as specified with 'wildmode'.
set gdefault         " Make g the default: :%s/foo/bar/ instead of :%s/foo/bar/g
set ttyfast          " Indicates a fast terminal connection.  More characters will be sent to the screen for redrawing,
set ruler            " Show the line and column number of the cursor position
set expandtab        " In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set history=200      " The command-lines that you enter are remembered in a history table
set undolevels=1000  " Maximum number of changes that can be undone.
set wildignorecase   " When set case is ignored when completing file names and directories.
set wildignore+=*.swp,*.bak,*.pyc,*.class,.git,*.asv
set wildignore+=*.aux,*.out,*.toc " latex
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " images
set wildignore+=*.DS_Store " OSX stuff
set wildignore+=*.o,*.exe,*.dll,*.manifest " compiled object files

" Align cindent function arguments with 'cino'
" void my_func(int arg1,  /* turns into this: */ void my_func(int arg1,
"       int arg2,                                             int arg2,
"       int arg3);                                            int arg3);
set cino+=(0

if has('unix')
    " unix-like platform
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
    " edit vimrc on unixoidal systems
    nnoremap <silent> <F2> :tabedit ~/.vim/vimrc<cr>
else
    " probably Windows
    set wildignore+=.git\*,.hg\*,.svn\*
    " edit vimrc on windows
    nnoremap <silent> <F2> :tabedit ~\vimfiles\vimrc<cr>
endif

set nowrap          " When on, lines longer than the width of the window will wrap and displaying continues on the next line.
set textwidth=0     " Maximum width of text that is being inserted.  A longer line will be broken after white space to get this width.
set spelllang=en,de " When the 'spell' option is on spellchecking will be done for these languages.
" UTF-8 settings
if has("multi_byte")
  set termencoding=utf-8       " Encoding used for the terminal. For the Win32 GUI 'termencoding' is not used for typed characters.
  set encoding=utf-8           " Sets the character encoding used inside Vim.
  setglobal fileencoding=utf-8 " Sets the character encoding for files
  set nobomb                   " no BOM (Byte Order Mark) is prepended to the file
endif

" MY KEYMAPS
" ----------

" Use Y to copy until the end of the line. Use yy to copy the whole line.
nnoremap Y y$
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
" CTRL-C are Copy
vnoremap <C-C> "+y
" CTRL-V for paste
map <C-V> "+gP
cmap <C-V> <C-R>+
inoremap <C-V> <C-R>+
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>
" Use CTRL-S for saving, also in Insert mode
noremap <C-S>   :update<CR>
vnoremap <C-S>  <C-C>:update<CR>
inoremap <C-S>  <C-O>:update<CR>
" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
" CTRL-Z is Undo; not in cmdline though
inoremap <C-Z> <C-O>u
" Ctrl-Backspace to delete the last word.
imap <C-BS> <C-W>
" change to current file's path
map <leader>cd :cd %:p:h<CR>:pwd<CR>
" Don't use Ex mode
" Or, use it to format: map Q gq
map Q <nop>
" Add a "d" shortcut for inside/around square brackets,
" like b for parens and B for curly braces:
onoremap id i[
onoremap ad a[
vnoremap id i[
vnoremap ad a[
" pastetoggle
set pastetoggle=<F8>
" Sane navigation between wrapped lines
nmap j gj
vmap j gj
nmap k gk
vmap k gk
" Remap cursorkeys (good training for hjkl keys)
" Left/Right: navigate tabs
" Up/Down: navigate quick-fix window
map <down> :cnext<CR>
map <up> :cprev<CR>
map <right> :tabnext<CR>
map <left> :tabprevious<CR>
map <A-down> :cnext<CR>
map <A-up> :cprev<CR>
map <A-right> :tabnext<CR>
map <A-left> :tabprevious<CR>
" navigation between windows
map <C-j> <C-W><C-J>
map <C-k> <C-W><C-K>
map <C-l> <C-W><C-L>
map <C-h> <C-W><C-H>
" Strips the trailing whitespace from a file
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z
" Open vimgrep and put the cursor in the right position
" noautocmd is important, otherwise autocommands (e.g. from plugins) are
" executed for each opened file.
map <leader>v :noautocmd vimgrep // **/*.*<left><left><left><left><left><left><left><left>
" plattform specific grep search / findstr stuff
" if in doubt, use vimgrep (<leader>v), but grep and findstr are faster.
if has('win32')
    " Use findstr.exe on Windows (or use GNU win32 grep:
    " http://gnuwin32.sourceforge.net/packages/grep.htm)
    " /S = include sub-directories
    " /P = ignore files with non-printable characters
    " /I = case-insensitive
    " /N = print line number
    set grepprg=findstr\ /spin
    " If you want to search for 'my teststring' in all .cpp and *.h files:
    " findstr /nips /c:"my teststring" *.cpp *.h
    " i.e.:
    " :grep /c:"my teststring" *.cpp *.h
    "
    " Prepare a grep/findstr search command
    map <Leader>g :silent grep /c:"" *.*<left><left><left><left><left>

    " Map a special grep for certain languages
    au FileType c,cpp map <Leader>s :silent grep /c:"" *.cpp *.c *.h<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
else
    " n = print line number
    " H = print file name
    " i = ignore case
    " r = include sub-directories
    set grepprg=grep\ -nHir\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags
    " If you want to search for 'my teststring' in all *.cpp and *.h files:
    " (don't forget the dot at the end!)
    " grep -nHir --include=*.cpp --include=*.h "my teststring" .

    " Prepare a grep search command
    map <Leader>g :silent grep --include=*.* "" .<left><left><left>

    " Map a special grep for certain languages
    au FileType c,cpp map <Leader>s :silent grep --include=*.cpp --include=*.h --include=*.c "" .<left><left><left>
endif

" ctags stuff:
" ------------
" use :tag, :ts, :tn, :tp for navigation
" use :CtrlPTag a. CtrlPBufTag for fuzzy search
" Taglist options
set tags=./tags,tags,./../tags,./../../tags
" Shortcut to generate tags file on F4
nnoremap <silent> <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" F3 goto tag (Eclipse like)
map <F3> <C-]>
" F12 goto tag (Visual Studio like)
map <F12> <C-]>
" use :tn and :tp (tag next, tag previous) to navigate between matches
map <leader>t <C-]>
" map manual key to tag preview
nnoremap K <C-w>}
" close the preview buffer
nnoremap <leader>k :pc<CR>
" tag complete in insert mode is <C-X><C-]>
" <c-x><c-]> is hard to type on a german keyboard. use t instead of ]
" inoremap <C-x><C-t> <C-X><C-]>

" VISUAL SETTINGS
" ---------------

" Fillchar (looks nicer for split windows)
set fillchars=
" set fillchars=diff:│,vert:│
" Console dark background
set background=dark
set synmaxcol=512 " maximum line length for syntax coloring
" set cursorline      " this is slooooooooow
" No sound on errors
set noerrorbells " don't ring the bell (beep or screen flash) for error messages.
set novisualbell " disable visual bell
set t_vb=        " disable visual bell
set nofoldenable " When off, all folds are open.
" 256 Terminal colors
set t_Co=256
" Detect whitespaces and tabs at the end of a line with red highlighting
" <whitespace detection>
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" </whitespace detection>

" visual settings for the GUI
if has('gui_running')
  " Set font
  if has('gui_macvim')
      set guifont=Monaco:h13
      " special MacVim option:
      " grow to maximum horizontal width on entering fullscreen mode
      set fuopt+=maxhorz
  elseif has('gui_gtk2')
      " for linux
      set guifont=DejaVu\ Sans\ Mono\ 10
  else
      " Consolas Font for Windows
      " http://www.microsoft.com/downloads/en/details.aspx?familyid=22e69ae4-7e40-4807-8a86-b3d36fab68d3&displaylang=en
      set guifont=Consolas:h11
      " set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI
  endif

  " Hide icons
  set guioptions-=T
  colorscheme blueshift

  " For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
  let &guioptions = substitute(&guioptions, "t", "", "g")

  set ballooneval " This feature allows a debugger, or other external tool, to display dynamic information based on where the mouse is pointing.
  set lazyredraw " the screen will not be redrawn while executing macros,
  set showcmd    " show partial command in last line of the screen (Set this option off if your terminal is slow.)
endif

" Status line
" More information in status line
"set statusline=%F%m%r%h%w\ format=%{&ff}\ enc=%{&fenc}\ type=%Y\ bom=%{&bomb}\ hex=\%02.2B\ col=%v
set laststatus=2     " Always display a statusline

" PLUGIN SETTINGS
" ---------------

" ctrlp settings
nmap <silent> <Leader>p :CtrlP<CR>
nmap <silent> <Leader>m :CtrlPMRUFiles<CR>
let g:ctrlp_extensions = [ 'tag', 'buffertag', 'dir' ]
let g:ctrlp_max_depth = 12
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_mruf_max = 800
let g:ctrlp_max_files = 10000
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_height = 20
let g:ctrlp_lazy_update = 100 " only update after 100 ms
if has('unix')
    let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlpcache'
    let g:ctrlp_mruf_case_sensitive = 1
else
    let g:ctrlp_cache_dir = $HOME.'\vimfiles\ctrlpcache'
    let g:ctrlp_mruf_case_sensitive = 0
endif
nmap <silent> <Leader>h :CtrlPTag<CR>
nmap <silent> <Leader>j :CtrlPBufTag<CR>
nmap <silent> <Leader>r :CtrlPBuffer<CR>
" Buffer Explorer to <leader>e
nmap <silent> <Leader>e :BufExplorer<CR>
let g:bufExplorerDefaultHelp=0
" NERDTree to <leader>f
nmap <silent> <Leader>f :NERDTree<CR>
au Filetype nerdtree setlocal nolist
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" NERD Commenter, turns the menu off
let NERDMenuMode = 0
" Tagbar as taglist replacement
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_usearrows = 0
nnoremap <silent> <leader>l :TagbarToggle<CR>

" YCM (YouCompleteMe) options
" YCM global config file
if has('unix')
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
else
    let g:ycm_global_ycm_extra_conf = $HOME.'\vimfiles\bundle\YouCompleteMe\cpp\ycm\.ycm_extra_conf.py'
endif

" clang_complete options
let g:clang_complete_loaded = 1 "disable by default
if has('gui_macvim')
    let g:clang_library_path = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
endif
if has('win32')
    " download clang for windows: http://llvm.org/releases/download.html#3.1
    " extract it to C:\Libs\clang\
    " Copy C\libs\clang\bin\clang.dll to C\libs\clang\bin\libclang.dll
    " Make sure the Vim Python support works (otherwise clang_complete fails)
    " use the mingw header files
    let g:clang_library_path = "C:/Program Files (x86)/LLVM/bin"
    let g:clang_user_options = "-ID:/Software/MinGW/include"
endif

" Syntastic options
if has('win32')
    " Syntastic is not really useful on many Windows systems, disable it there:
    " let g:loaded_syntastic_plugin = 1
    " let g:syntastic_mode_map = { 'mode': 'passive' } " manually check with: :SyntasticCheck
endif
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1

" FILE SPECIFIC SETTINGS
" ----------------------

" LaTex specific
let tlist_tex_settings='Tex;l:labels;s:sections;t:subsections;u:subsubsections'
autocmd BufEnter *.tex    compiler tex
autocmd BufEnter *.tex    let g:tex_flavor='pdflatex'
autocmd BufEnter *.tex    let b:tex_flavor = 'pdflatex'
" Two possible ways for latex compilation with errors in Vim:
" a) The following binding: (which is fine for single file latex documents)
" autocmd BufEnter *.tex    set makeprg=pdflatex\ -file-line-error\ --shell-escape\ -interaction=nonstopmode\ %
" b) A batch file (under windows) with the name "make.bat" and the following content:
" @echo off
" pdflatex -file-line-error --shell-escape -interaction=nonstopmode MYMAINFILE.tex MYMAINFILE
" (make sure that makeprg is set to "make", approach b) is more suitable for
" larger latex projects (like a thesis):
autocmd BufEnter *.tex    set makeprg=make
autocmd BufEnter *.tex    set errorformat=%f:%l:\ %m

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab

" BACKUP SETTINGS
" ---------------

" Backup, swapfile, undo stuff
" Turn off backup (good idea?)
set nobackup
set nowb
set noswapfile
if version >= 703
  set cm=blowfish
endif

