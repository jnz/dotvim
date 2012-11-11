" Jan Zwiener's vimrc
" ===================
" jan@zwiener.org

" PATHOGEN
" --------

" Pathogen init: load all plugins from bundle/ directory
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" MY VIM SETTINGS
" ---------------

" >10 years of working with Windows...
behave mswin " this should change the following variables:
" Just to be sure:
" behave mswin start
set mousemodel="popup"
set selectmode="mouse,key"
set keymodel="startsel,stopsel"
" behave mswin stop
set guioptions+=egmrL
" Disable autocopy on select
set guioptions-=a
set guioptions-=A
set guioptions-=aA

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
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
set virtualedit+=block
" Taglist options
set tags=./tags,tags,./../tags,./../../tags
" match paren is slow (e. g. in large latex code)
let loaded_matchparen = 1
" Common vim stuff
set linebreak
set ignorecase
set smartcase
set hidden
set copyindent
set autoindent
set tabstop=4
set shiftwidth=4
set scrolloff=5
set sidescrolloff=10
set ffs=unix,dos
set smarttab
set number
set showbreak=>
set autoread " if the file has changed outside, but was not modified in vim: reload
set autowrite " Automatically save before commands like :next and :make
set hlsearch
set incsearch
set wildmenu
set gdefault " Make g the default: :%s/foo/bar/ instead of :%s/foo/bar/g
set ttyfast
set ruler
set expandtab
set ballooneval
syntax on
filetype on
filetype plugin on
filetype indent on
set shortmess=atToO
set history=1000
set undolevels=1000
set wildignore+=*.swp,*.bak,*.pyc,*.class,.git,*.asv
set wildignore+=*.aux,*.out,*.toc " latex
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " images
set wildignore+=*.DS_Store " OSX bullshit
set wildignore+=*.o,*.exe,*.dll,*.manifest " compiled object files

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

" Wrapping
set nowrap
" text width = 80 characters
set tw=80
" Spell check language (set spell):
set spelllang=en,de
" UTF-8 settings
if has("multi_byte")
  set termencoding=utf-8
  "if &termencoding == ""
    "let &termencoding = &encoding
  "endif
  set encoding=utf-8
  setglobal fileencoding=utf-8 nobomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
" Abbreviations
iabbrev teh the
iabbrev dont don't
" Fast to type than Grüße
iabbrev gruse Grüße
iabbrev grusen Grüßen
iabbrev lets let's
iabbrev mfg Mit freundlichen Grüßen

" MY KEYMAPS
" ----------

" Leave input mode with jj - much faster than reaching for the esc key and only
" very rarely a hurdle.
inoremap jj <Esc>
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
inoremap <C-Z> <C-O>u
" Ctrl-Backspace to delete the last word.
imap <C-BS> <C-W>
" Set <leader> to ,
let mapleader = ","
let g:mapleader = ","
" change to current file's path
map <leader>cd :cd %:p:h<CR>:pwd<CR>
" Don't use Ex mode, use Q for formatting
map Q gq
" Easier to type:
noremap H ^
" Fuck you, help key
noremap  <F1> <nop>
inoremap <F1> <nop>
" Fuck you too, manual key.
nnoremap K <nop>
" Add a d shortcut for inside/around square brackets,
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
map <down> :cnext<CR>
map <up> :cprev<CR>
map <right> :tabnext<CR>
map <left> :tabprevious<CR>
map <A-down> :cnext<CR>
map <A-up> :cprev<CR>
map <A-right> :tabnext<CR>
map <A-left> :tabprevious<CR>
" Shortcut to generate tags file on F4
nnoremap <silent!> <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" navigation between windows
map <C-j> <C-W><C-J>
map <C-k> <C-W><C-K>
map <C-l> <C-W><C-L>
map <C-h> <C-W><C-H>
" Easy half-page scrolling with <space>
nnoremap <Space> <C-d>
nnoremap <S-Space> <C-u>
" Support this in visual-mode
vnoremap <Space> <C-d>
vnoremap <S-Space> <C-u>
" Remove search highlighting with <enter>
nnoremap <CR> :noh<CR>
" F3 goto tag (Eclipse like)
map <F3> g<C-]>
" F12 goto tag (Visual Studio like)
map <F12> g<C-]>
" use tnext, tprev, tselect for further navigation

" Strips the trailing whitespace from a file
" function! <SID>StripTrailingWhitespaces()
"     " Preparation: save last search, and cursor position.
"     let _s=@/
"     let l = line(".")
"     let c = col(".")
"     " Do the business:
"     %s/\s\+$//e
"     " Clean up: restore previous search history, and cursor position
"     let @/=_s
"     call cursor(l, c)
" endfunction
" " Map StripTrailingWhitespaces to <leader>w:
" nnoremap <silent> <leader>w :call <SID>StripTrailingWhitespaces()<CR>
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z


" VISUAL SETTINGS
" ---------------

" Fillchar (looks nicer for split windows)
set fillchars=
" Console dark background
set background=dark
set noshowmatch
set synmaxcol=512 " maximum line length for syntax coloring
" set cursorline      " this is so slooooooooow
set textwidth=0
" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
" set foldmethod=syntax
set nofoldenable
" 256 Terminal colors
set t_Co=256
" Detect whitespaces and tabs at the end of a line
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
"
" visual settings for the GUI
if has('gui_running')
  " Set font
  if has('gui_macvim')
      " DejaVu looks better than Consolas on Mac OS X
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
  " Powerline fancy
  let g:Powerline_symbols = 'fancy'

  " Hide icons
  set go-=T
  colorscheme smyck

  " For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
  let &guioptions = substitute(&guioptions, "t", "", "g")

  set lazyredraw
endif

" Status line
" More information in status line
"set statusline=%F%m%r%h%w\ format=%{&ff}\ enc=%{&fenc}\ type=%Y\ bom=%{&bomb}\ hex=\%02.2B\ col=%v
set laststatus=2     " Always display a statusline

" PLUGIN SETTINGS
" ---------------

" ctrlp settings
" Basically the FuzzyFinder coverage mode is comparable
" to ctrlp, but ctrlp seems to be faster for me (non scientific statement)
nmap <silent> <Leader>p :CtrlPRoot<CR>
nmap <silent> <Leader>r :CtrlPCurWD<CR>
nmap <silent> <Leader>m :CtrlPMRUFiles<CR>
let g:ctrlp_extensions = [ 'tag', 'buffertag' ]
let g:ctrlp_working_path_mode = 2 " heuristic: going up the tree to find a project root
let g:ctrlp_mruf_max = 250
let g:ctrlp_max_files = 10000
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_height = 20
if has('unix')
    let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlpcache'
    let g:ctrlp_mruf_case_sensitive = 1
else
    let g:ctrlp_cache_dir = $HOME.'\vimfiles\ctrlpcache'
    let g:ctrlp_mruf_case_sensitive = 0
endif
nmap <silent> <Leader>j :CtrlPTag<CR>
nmap <silent> <Leader>h :CtrlPBufTag<CR>
" Buffer Explorer to <leader>e
nmap <silent> <Leader>e :BufExplorer<CR>
let g:bufExplorerDefaultHelp=0
" NERDTree to <leader>d
nmap <silent> <Leader>d :NERDTree<CR>
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

" SuperTab options
" Tab in insert mode activates completion.
" let g:SuperTabDefaultCompletionType = 'context'
" let g:SuperTabContextDefaultCompletionType = "<c-n>"
" let g:SuperTabLongestHighlight = 1
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" clang_complete options
let g:clang_complete_auto = 0
let g:clang_complete_copen = 1
let g:clang_snippets_engine = "snipmate"
"if has('gui_macvim')
    "let g:clang_use_library = 1
    "let g:clang_library_path = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
"endif
if has('win32')
    " For now deactivate the clang library on windows
    let g:clang_use_library = 0

    " The quotes at the beggining of clang_exec and at the end of clang_user_options are important, don't remove them
    " They basically trick vim into thinking clang executed fine, because the msvc build autocompletes correctly but fails
    " to compile.
    " Don't forget to put paths with spaces in quotes other wise vim won't be able to execute the command
    "let g:clang_exec = '"C:\jan\cl\llvm\build\bin\clang.exe'
    "let g:clang_user_options = '2> NUL || exit 0"'
    "let g:clang_use_library = 1
    "let g:clang_library_path = 'C:\jan\cl\llvm\build\bin'
endif

" Syntastic options
" Disable syntastic on Windows at the moment
if has('win32')
    let g:loaded_syntastic_plugin = 1
endif
let g:syntastic_enable_signs = 1
let g:syntastic_disabled_filetypes = ['html']
let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'
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

