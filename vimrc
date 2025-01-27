" vimrc (Jan Zwiener, jan@zwiener.org)
"
" =============================================================================
" Information
" =============================================================================
"
" vimrc sections:
"  - Neovim/Vim                 Neovim/Vim specific settings
"  - Settings                   General settings
"  - Keymaps                    Key bindings
"  - ctags                      ctags specific settings
"  - Visual settings            Change the look and feel
"  - Plugin settings            Settings for different plugins
"  - File specific settings     Settings for file types (e.g. for .tex files)
"
" Tag based code navigation
" -------------------------
"
" F4 to generate tags in current directory (should be in source root).
" F3/F12/<leader>t to goto tag under cursor.
" Ctrl-o / Ctrl-i navigate backward/forward.
" K to preview function, <leader>k to close preview.
"
" Special <leader> commands:
" --------------------------
" <leader>p        :CtrlP (similar to :FZF)
" <leader>m        :CtrlPMRUFiles (similar to fzf.vim's :History)
" <leader>e        :BufExplorer
" <leader>f        :NERDTree
" <leader>n        :Make
" <leader>g        ripgrep
" <leader>w        Remove trailing whitespaces
" <leader>v        Sync Tex
" <C-x><C-t>       Tag complete in insert mode
" <leader>cc       Comment out the current line or text selected in visual mode
"
" Use :tag, :ts, :tn, :tp for navigation.
" :CtrlPTag (similar to fzf.vim's :Tags)
"
" Limitations of the terminal:
"
" If <C-s> is freezing your terminal, press <C-q> to unfreeze it.
" Add a new line with 'stty -ixon' to your .bashrc
" <S-Space> won't work.
" <C-BS> won't work.
"
" Profile Vim:
"   * Execute :profile start profile_result.txt | profile func *
"   * Do some stuff (moving cursor around or splitting windows)
"   * Quit Vim.
"   * Open result file and go to the last part of the log, see what's causing
"     your editor heavy.
"
"   * vim --startuptime vim.log
"
" Searching with grep/find:
"    * grep -rin text .
"    * find . -iname '*jan*'
" On Windows:
"    * dir /s /b *filename*
"    * findstr /spin "jan" *.txt
"
" Using findstr.exe on Windows: findstr /spin /c:"searchString" *.*
" /S = include sub-directories
" /P = ignore files with non-printable characters
" /I = case-insensitive
" /N = print line number
"
" prepare the grep options (for :vimgrep and :grep, not for the AsyncRun stuff below)
" set grepprg=grep\ --exclude-dir=\".git\"\ --exclude=tags\ -n\ $\*\ /dev/null
" grep parameters:
" n = print line number
" H = print file name
" i = ignore case
" r = include sub-directories

" set guioptions+=M  " for GVIM: disable loading of menu.vim (must be set before 'syntax on')

syntax on
filetype plugin indent on

" Detect environment
" (from https://github.com/justinmk/config/blob/master/.vimrc)
" Global g: so that we can use it e.g. in .vimrc.local
let g:is_msys = ($MSYSTEM =~? 'MINGW\d\d')
let g:is_msysgit = (has('win32') || has('win64')) && $TERM ==? 'cygwin'
let g:is_gui = has('gui_running') || strlen(&term) == 0 || &term ==? 'builtin_gui'
let g:is_windows = has('win32') || has('win64') || g:is_msys || g:is_msysgit

if has('nvim')
" =============================================================================
" Neovim
" =============================================================================
    if g:is_windows
        set runtimepath^=$HOME/vimfiles/
    else
        set runtimepath^=~/.vim
    endif
    let &packpath=&runtimepath

    " For WSL clipboard (from Neovim FAQ):
    " ------------------------------------
    " curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
    " unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
    " chmod +x /tmp/win32yank.exe
    " sudo mv /tmp/win32yank.exe /usr/local/bin/
    if exists("g:neovide")
        " let g:neovide_transparency = 0.95
        " let g:transparency = 0.95
        let g:neovide_floating_shadow = v:true
        let g:neovide_floating_z_height = 10
        let g:neovide_light_angle_degrees = 45
        let g:neovide_light_radius = 5
    endif
else
" =============================================================================
" Vim
" =============================================================================
    set cryptmethod=blowfish2
    " remember up to 250 files
    set viminfo='250,<0,/0,s0,:0,h
    if g:is_windows
        set viminfo+=n~/vimfiles/viminfo
    else
        set viminfo+=n~/.vim/viminfo
    endif
endif

" Essential:
" Leave input mode with jj - much faster than reaching for the esc key and only
" very rarely a hurdle:
inoremap jj <Esc>
" Set <leader> to ,
let mapleader=','
let g:mapleader=','
" Easy half-page scrolling with <space>:
nnoremap <Space> <C-d>
" won't work in a terminal:
nnoremap <S-Space> <C-u>
" Support this in visual-mode:
vnoremap <Space> <C-d>
" won't work in a terminal
vnoremap <S-Space> <C-u>
" Clear the highlighting of :set hlsearch
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
nnoremap <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : ':nohlsearch<CR>'

" =============================================================================
" Settings
" =============================================================================

" Mouse:
set mousemodel=popup           " Right mouse button pops up a menu
set selectmode=mouse,key       " Select text with the mouse or with shift+cursor keys
set mouse=a                    " Enable the mouse
set guioptions-=aA             " Vim won't become the owner of the windowing system's global selection
set backspace=indent,eol,start " Backspace wrap to previous/next line
set whichwrap+=<,>,[,]         " Cursor left/right to move to the previous/next line
" Clipboard: (use :checkhealth on neovim), ^= operator to prepend string
set clipboard^=unnamed,unnamedplus
" Complete options (disable preview window):
set completeopt=menu,menuone,longest
set complete-=i      " Don't scan include files (use a tags file)
set complete+=spell  " Auto complete words from dictionary (if spell checking is enabled with :set spell)
" Limit the number of items to 15 in the completion popup menu:
set pumheight=15
" Select empty areas with visual block mode:
set virtualedit=block
set linebreak        " If on Vim will wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen
set ignorecase       " If the 'ignorecase' option is on, the case of normal letters is ignored
set smartcase        " Case insensitive searches become sensitive with capitals
set hidden           " Edit multiple buffers without saving the modifications made to a buffer
set autoindent       " Copy indent from current line when starting a new line
set tabstop=4        " Number of spaces that a <Tab> in the file counts for. This is not 8, this is 4
set shiftwidth=4     " Number of spaces to use for each step of (auto)indent. when zero the 'ts' value will be used
set shiftround       " Round indent to multiple of 'shiftwidth'.  Applies to > and < commands
set scrolloff=5      " Minimal number of screen lines to keep above and below the cursor
set sidescrolloff=10 " The minimal number of screen columns to keep to the left and to the right of the cursor
set ffs=unix,dos     " This gives the end-of-line (<EOL>) formats that will be tried when starting to edit a new buffer and when reading a file into an existing buffer
set smarttab         " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'. A <BS> will delete a 'shiftwidth' worth of space at the start of the line
set number           " Precede each line with its line number
set showbreak=>      " String to put at the start of lines that have been wrapped
set showmode         " If in Insert, Replace or Visual mode put a message on the last line
set autoread         " If the file has changed outside, but was not modified in vim: reload
set autowrite        " Automatically save before commands like :next and :make
set hlsearch         " When there is a previous search pattern, highlight all its matches
set nolangremap      " Disable a legacy behavior that can break plugin maps
set history=250      " Recall command-lines with up and down cursor keys
set incsearch        " While typing a search command, show where the pattern, as it was typed so far, matches
set wildmenu         " When 'wildmenu' is on, command-line completion operates in an enhanced mode. Press 'wildchar' (usually <Tab>) to invoke completion
set wildchar=<Tab>   " Character you have to type to start wildcard expansion in the command-line, as specified with 'wildmode'
set wildmode=full    " Completion mode: complete longest common string, then each full match
try
    set wildoptions+=pum " Vim9 pop-up menu
    set wildoptions+=fuzzy
catch
endtry
set gdefault         " Make g the default: :%s/foo/bar/ instead of :%s/foo/bar/g
set ttyfast          " Indicates a fast terminal connection.  More characters will be sent to the screen for redrawing
set noshowmatch      " When a bracket is inserted, briefly jump to the matching one
set expandtab        " In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set nrformats-=octal " Ignore octal numbers for CTRL-A and CTRL-X
set ttimeout         " Time out on :mappings and key codes
set ttimeoutlen=100  " The time in milliseconds that is waited for a key sequence to complete
set lazyredraw       " The screen will not be redrawn while executing macros
set noshowcmd        " Show partial command in last line of the screen (set this option off if your terminal is slow.)
set showtabline=1    " 2=Always display tabs
set formatoptions+=n " When formatting text, recognize numbered lists
if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j " Where it makes sense, remove a comment leader when joining lines
endif
set wildignorecase   " When set case is ignored when completing file names and directories
set wildignore+=*.o,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.swp,*.bak,*.pyc,*.class,.git,*.asv
set wildignore+=*.aux,*.out,*.toc " latex
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " images
set wildignore+=*.DS_Store " OSX stuff
set wildignore+=*.zip,*.7z " compressed files
set nobackup         " turn off backup
set nowb             " Make a backup before overwriting a file
set noswapfile       " Disable swap files. If Vim or your computer crashes, swapfiles allow you to recover those changes
set nowrap           " When on, lines longer than the width of the window will wrap and displaying continues on the next line
set textwidth=0      " Maximum width of text that is being inserted.  A longer line will be broken after white space to get this width
set spelllang=de,en_us " When the 'spell' option is on spellchecking will be done for these languages
set encoding=utf-8   " utf-8 everywhere
set termencoding=utf-8 " utf-8 everywhere
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" set grepprg=grep\ --exclude-dir=\".git\"\ --exclude=tags\ -n\ $\*\ /dev/null

" cindent:
" help: :h cinoptions-values
" Align cindent function arguments with 'cino'
" void my_func(int arg1,  >   void my_func(int arg1,
"       int arg2,         >                int arg2,
"       int arg3);        >                int arg3);
set cino+=(0
" Align C++ scope declarations (public, private, protected):
"                   g0:
" ---------------------------
" {             >   {
"     public:   >   public:
"     a = b;    >       a = b;
"     private:  >   private:
" }             >   }
set cino+=g0
" Adjust (0 for long lines with W4:
" a_long_line(              >  a_long_line(
"             argument,     >     argument,
"             argument);    >     argument);
" a_short_line(argument,    >  a_short_line(argument,
"              argument);   >               argument);
set cino+=W4

" add a custom spellfile
" if g:is_windows
"     set spellfile=~/vimfiles/spell/de.utf-8.add
" else
"     set spellfile=~/.vim/spell/de.utf-8.add
" endif

" The following snippet (function change_dir_once and au BufRead * call
" s:change_dir_once()) is used to change to working directory to the
" first file opened in a vim session. because this is normally where i expect
" my working directory. subsequent files won't change the path.
" The :Rooter command (from the vim-rooter plugin) tries to find a project root
" directory (if it exists).
function! s:change_dir_once() abort
    if !exists('s:change_dir_once_latch')
        cd %:p:h
        if exists('g:loaded_rooter')
            :Rooter
        endif
        let s:change_dir_once_latch=1
    endif
endfunction
augroup ChangeDirOnceGroup
    autocmd!
    autocmd BufRead * call s:change_dir_once()
augroup END

" jump to the last position when reopening a file
" from :help last-position-jump
au BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
   \ |   exe "normal! g`\""
   \ | endif

" =============================================================================
" Keymaps
" =============================================================================

" Use CTRL-S for saving, also in Insert mode (<C-O> doesn't work well when
" using completions).
noremap <C-S> :write<CR>
vnoremap <C-S> <C-C>:write<CR>
inoremap <C-S> <Esc>:write<CR>gi
" Ctrl-Backspace to delete the last word (for gVim, terminals can't do <C-BS>):
inoremap <C-BS> <C-W>
" Paste text into command line with <C-v>
cnoremap <C-V> <C-R>+
" Paste text in insert mode with <C-v>
inoremap <C-V> <C-R>+
" Change to current file's path:
noremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" :Make shortcut (run make with <leader>n):
noremap <leader>n :Make<CR>
" Don't use Ex mode:
noremap Q :echo 'Ex mode disabled'<CR>
noremap gQ :echo 'Ex mode disabled'<CR>
" Yank to the end of the line (consistent with C and D command)
nnoremap Y y$
" Sane navigation between wrapped lines:
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
" Simple navigation between windows:
noremap <C-j> <C-W><C-J>
noremap <C-k> <C-W><C-K>
noremap <C-l> <C-W><C-L>
noremap <C-h> <C-W><C-H>
" jj to leave terminal insert mode
tnoremap jj <C-\><C-n>
" might break e.g. FZF in the terminal:
" tnoremap <Esc> <C-\><C-n>

" Navigation in terminal mode
tnoremap <C-j> <C-\><C-n><C-W>j
tnoremap <C-k> <C-\><C-n><C-W>k
tnoremap <C-l> <C-\><C-n><C-W>l
tnoremap <C-h> <C-\><C-n><C-W>h

" Strips the trailing whitespace from a file:
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Use ripgrep if available
if executable('rg')
    nnoremap <Leader>g :AsyncRun rg --vimgrep --smart-case ""<left>
else
    nnoremap <Leader>g :AsyncRun grep --exclude-dir=".git" --exclude=tags -rin '' .<left><left><left>
end

" Press F2 to open the vimrc config:
if g:is_windows
    nnoremap <silent> <F2> :edit ~/vimfiles/vimrc<cr>
else
    nnoremap <silent> <F2> :edit ~/.vim/vimrc<cr>
endif

" =============================================================================
" ctags
" =============================================================================

" Search for tags file path:
set tags=./tags,tags,./../tags,./../../tags
" Shortcut to generate tags file with F4:
nnoremap <F4> :AsyncRun ctags -R .<CR>
" F3 goto tag (Eclipse like), use <C-o> to jump back:
noremap <F3> <C-]>
" F12 goto tag (Visual Studio like), use <C-o> to jump back:
noremap <F12> <C-]>
" use :tn and :tp (tag next, tag previous) to navigate between matches:
noremap <leader>t <C-]>
" map manual key to tag preview:
nnoremap K <C-w>}
" close the preview buffer:
nnoremap <leader>k :pc<CR>
" tag complete in insert mode is <C-X><C-]>
" <c-x><c-]> is hard to type on a german keyboard. use t instead of ]
" This is normally used for thesaurus completion
inoremap <C-x><C-t> <C-X><C-]>

" =============================================================================
" Visual settings
" =============================================================================

" Empty fillchar (looks nicer for split windows):
" set fillchars=
set synmaxcol=256 " maximum line length for syntax coloring
set noerrorbells  " don't ring the bell (beep or screen flash) for error messages
set novisualbell  " disable visual bell
set t_vb=         " disable visual bell
set belloff=all   " just be quiet
set nofoldenable  " When off, all folds are open
" set cursorline  " this is slooooooooow, don't use it
" set termguicolors " use 24-bit color

if g:is_gui
    " Set font
    if has('gui_macvim')
        set guifont=Monaco:h13
        " special MacVim option:
        " grow to maximum horizontal width on entering fullscreen mode
        set fuopt+=maxhorz
    elseif has('gui_gtk3') || has('gui_gtk2')
        " for linux
        " set guifont=DejaVu\ Sans\ Mono\ 12
        set guifont=Monospace\ 12
    elseif g:is_windows
        " Consolas Font for Windows
        set guifont=Consolas:h12
        if has("directx")
            set renderoptions=type:directx
        endif
        " autocmd GUIEnter * simalt ~x  " always maximize initial GUI window
    endif

    set guioptions-=t " no tearoff menu entries
    set guioptions-=T " hide icons
    " set guioptions-=m " hide menu
    " set guioptions-=r " no right scrollbar
    set guioptions-=R " Right-hand scrollbar is present when there is a vertically split window
    set guioptions-=l " no left scrollbar
    set guioptions-=L " Left-hand scrollbar is present when there is a vertically split window
    if has('ballooneval')
        set ballooneval " This feature allows a debugger, or other external tool, to display dynamic information based on where the mouse is pointing
    endif
    set lines=40 columns=120 " default window size is a bit small. only use for GUI vims

else
    if has('balloon_eval_term')
        set balloonevalterm  " Switch on the |balloon-eval| functionality for the terminal.
    endif
    " Console settings (don't make it a default):
    " colorscheme wombat256

    " Cursor in Windows Terminal (https://vim.fandom.com/wiki/Configuring_the_cursor)
    " Source: https://github.com/microsoft/terminal/issues/4335
    " 1 or 0 -> blinking block
    " 6 -> solid vertical bar
    if &term =~ '^xterm'
        " normal mode
        let &t_EI .= "\<Esc>[0 q"
        " insert mode
        let &t_SI .= "\<Esc>[6 q"
    endif
endif

" Display tabs, trailing white spaces, nbsp, etc.
set list listchars=tab:>\ ,trail:.,extends:>,precedes:<,nbsp:.
set display+=lastline  " As much as possible of the last line in a window will be displayed.

" Status line
" More information in status line:
" %F Full path, %m modified flag [+], %r readonly flag [RO], %h help flag [help],
" %w Preview window flag [Preview]
" Based on default status line, but adds the file format, the file encoding,
" and the file type.
set statusline=%<%F\ %h%m%r%=buf=%n\ 0x%02.2B\ %y\ %{&fenc}\ [%{&ff}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2     " Always display a statusline

" Color hack for Git Bash for Windows.
" Set t_Co for msys or msysgit:
if g:is_msys || g:is_msysgit
   set t_Co=256
endif

" Windows Terminal specific settings
" Detect Windows Terminal (Stack Overflow: 57014805)
let uname = substitute(system('uname'),'\n','','')
if uname == 'Linux'
    let lines = readfile("/proc/version")
    if lines[0] =~ "Microsoft"
        " Disable mouse selection inside of Vim, so we can use Windows
        " Terminal selection and Ctrl+Shift+C to copy text
        set mouse=""
        " WSL yank support (Stack Overflow: 1291425)
        if has('nvim')

            let g:clipboard = {
                \   'name': 'win32yank-wsl',
                \   'copy': {
                \      '+': 'win32yank.exe -i --crlf',
                \      '*': 'win32yank.exe -i --crlf',
                \    },
                \   'paste': {
                \      '+': 'win32yank.exe -o --lf',
                \      '*': 'win32yank.exe -o --lf',
                \   },
                \   'cache_enabled': 0,
                \ }
        else

            let s:clip = 'clip.exe' " change this path according to your mount point
            if executable(s:clip)
                augroup WSLYank
                    autocmd!
                    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
                augroup END
            endif

        endif
    endif
endif

" =============================================================================
" Plugin settings
" =============================================================================

let g:loaded_vimballPlugin = 1 " Tell vimball to get lost.
let g:loaded_rrhelper = 1 " disable weird plugin

" Matchit:
let g:loaded_matchparen = 1 " matchit is slow, disable it
runtime macros/matchit.vim

" Ctrlp (use <c-e> to toggle to exact mode):
nnoremap <silent> <Leader>p :CtrlP<CR>
nnoremap <silent> <Leader>m :CtrlPMRUFiles<CR>
" 'tag'       - :CtrlPTag    - Search for a tag within a generated central tags file
let g:ctrlp_extensions          = [ 'tag' ]
" CtrlP sets its local working directory according to this variable:
" r - the nearest ancestor of the current file that contains one of these
"      directories or files: .git .hg .svn .bzr _darcs
" a - the directory of the current file, unless it is a subdirectory of the cwd
let g:ctrlp_working_path_mode   = '0'
" Specify the number of recently opened files you want CtrlP to remember:
let g:ctrlp_mruf_max            = 500
" Number of files to scan initially:
let g:ctrlp_max_files           = 8000
" Only update when typing has stopped after 100 ms:
let g:ctrlp_lazy_update         = 0
" For more files than this, no sorting will be performed to improve
" performance, but quality of fuzzy finding results is reduced
" let g:ctrlp_compare_lim         = 500
let g:ctrlp_use_caching = 1 " Enable per-session caching, press F5 to purge
" Set this to 0 to enable cross-session caching by not deleting the cache files:
let g:ctrlp_clear_cache_on_exit = 1
" Set to 1 for searching by filename by default and not the full path (<c-d>
" to toggle)
let g:ctrlp_by_filename           = 1
let g:ctrlp_mruf_case_sensitive   = 0
" Set directory for ctrlp cache:
if has('win32') || has('win64')
    let g:ctrlp_cache_dir=$HOME.'/vimfiles/ctrlpcache'
else
    let g:ctrlp_cache_dir=$HOME.'/.vim/ctrlpcache'
endif
" The default built-in search is pretty slow with a higher depth and can
" take minutes (after that it is fast if caching is enabled though).
" Note: this setting does not apply if ripgrep (rg) is used,
" adjust rg's -max-depth=NUM argument below
let g:ctrlp_max_depth             = 7
" if ripgrep (rg) is available, use it for searching files

if executable('rg')
    let g:ctrlp_user_command = 'rg %s --max-depth=12 --files --color=never --glob ""'
    " let g:ctrlp_use_caching = 0 " disable per-session caching
end

" Buffer Explorer:
nnoremap <silent> <Leader>e :BufExplorer<CR>
let g:bufExplorerDefaultHelp    = 0
" taken to the active window when selecting a buffer
let g:bufExplorerFindActive     = 0

" Lazy loading of NERDTree Plugin:
function! RebindNerdTree()
    nnoremap <silent> <Leader>f :NERDTreeToggle<CR>
endfunction
nnoremap <silent> <Leader>f :packadd nerdtree <bar> :NERDTree <bar> :call RebindNerdTree()<CR>
au Filetype nerdtree setlocal nolist

" NERD Commenter:
let NERDMenuMode                = 0

" AsyncRun:
" Add the :Make command for async. make calls
command! -bang -nargs=* -complete=file Make AsyncRun -save=2 -program=make @ <args>
" Use F9 to toggle quickfix window rapidly:
noremap <silent> <F9> :call asyncrun#quickfix_toggle(7)<cr>
" automate opening quickfix window when AsyncRun starts:
augroup vimrc
    autocmd!
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END
" The only reason to set asyncrun_stdin to 0 is that ripgrep won't work
" otherwise (date: 13.12.2020). If this is handled by asyncrun or ripgrep
" in the future, remove that line:
let g:asyncrun_stdin = 0

" Vim-Rooter:
let g:rooter_silent_chdir = 1   " stop vim-rooter echoing the project directory
let g:rooter_change_directory_for_non_project_files = ''  " Don't change directory
let g:rooter_manual_only = 1    " stop vim-rooter changing directory automatically

" =============================================================================
" File specific settings
" =============================================================================

" LaTex specific:
"
" if pdflatex is run with synctex=1, we can directly jump to the PDF position we are
" currently editing in some PDF viewers.
function! SyncTexForward() abort
    if g:is_windows
        " let execstr='!echo %:p:r.pdf -forward-search %:p '.line(".")
        " Expression %:p:r.pdf - Current file with .pdf ending
        " Expression %:p       - Current file (.tex)
        " Expression line(".") - Function returns current line
        " Yeah, the Sumatra PDF path is hard coded here.
        let execstr='!start /B "c:\\Program Files\\SumatraPDF\\SumatraPDF.exe" %:p:r.pdf -reuse-instance -forward-search %:p '.line(".").''
        exec execstr
        " redraw, otherwise the terminal window is messed up:
        redraw!
    else
        " For backwards search configure Okular:
        " Settings -> Editor -> Command: gvim --remote +%l %f
        " Earlier I had to configure Okular like this:
        " Settings -> Editor -> Command: gvim --remote +%{line} %{input}
        " In browse mode (hand visible) press Shift+Left click to jump to gvim
        "
        " The following command is for FORWARD search from vi to okular
        let execstr = "silent !okular --unique " .. expand("%:p:r") .. ".pdf\\#src:" .. line(".") .. expand("%:p") .. " &"
        execute execstr
    endif
endfunction
augroup LatexGroup
    autocmd!
    autocmd BufEnter *.tex    compiler tex
    autocmd BufEnter *.tex    setlocal makeprg=make
    autocmd BufEnter *.tex    setlocal errorformat=%f:%l:\ %m
    autocmd BufEnter *.tex    nnoremap <Leader>v :call SyncTexForward()<CR>
    " autocmd BufEnter *.tex    setlocal wrap
augroup END

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs:
augroup MakefileGroup
    autocmd!
    autocmd FileType make setlocal noexpandtab
augroup END
let g:tex_comment_nospell = 1  " don't spell check in comments

" Python pylint
autocmd FileType python setlocal makeprg=pylint\ --output-format=parseable\ % | setlocal autowrite

" =============================================================================
" Machine specific settings
" =============================================================================

" If there are any machine-specific tweaks for Vim, load them from the following file.
"
" e.g.:
"   if g:is_gui
"       colorscheme blueshift
"   else
"       colorscheme wombat256
"   endif
"
" For vim-clang-format
" let g:clang_format#auto_format=1

silent! source ~/.vimrc.local
