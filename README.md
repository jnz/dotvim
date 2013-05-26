Jan Zwiener's Vim config
========================

Installation from Github
------------------------

Installation:

    git clone git://github.com/jnz/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

Update all submodules

    git submodule foreach git checkout master
    git submodule foreach git pull

Add a new submodule

    git submodule add URL bundle/NAME
    git submodule init
    git submodule update

Remove a submodule

    edit .gitmodules and remove the module
    edit .git/config and remove the module
    git rm --cached bundle/submodulepath
    rm -rf bundle/submodulepath


Common commands (Command mode)
------------------------------

Note: ^ means Ctrl key

 Key                | Description
--------------------|---------------------------------------------------------
 :q!              | Exit :-)
 Esc, ^C          | Command mode
 i                | Insert mode
 w                | Next word
 b                  | Previous word
 e                  | End of word
 s                  | Replace character and enter insert mode
 S                  | Replace complete line
 I                  | Insert at beginning of line
 A                  | Insert at end of line
 u                  | Undo
 ^R                 | Redo
 .                  | Redo input (very useful)
 ci"                | Edit current "string"
 ci'                | Edit current 'string'
 ciw                | Edit current word
 cit                | Edit tag content (very useful for HTML editing)
 cib                | Edit current parenthesis block
 ciB                | Edit current curly brace block
 "ay                | Copy to buffer a
 "ap                | Yank from buffer a
 ^Ra                | Insert buffer a in ex mode
 "1                 | Insert from buffer history (0-9)
 >>                 | Shift rightwards
 <<                 | Shift leftwards
 ^X ^O              | Omnicomplete
 ^N                 | Autocomplete
 ^X ^F              | Filename complete
 ^X ^L              | Line complete
 :tabnew            | New tab
 :tabclose          | Close tab
 gt                 | Next tab
 gT                 | Previous tab
 ^PageUp            | Next tab
 ^PageDown          | Previous tab
 :make              | Run make command
 :cl                | Error list (from make)
 :cn / :cp          | Next error
 :cd                | Change directory
 :lcd               | Change directory (for current window)
 =                  | Format selected area
 ==                 | Format current line
 =}                 | Format current function
 gg=G               | Format complete file
 qa                 | Record macro to buffer a
 q                  | End macro recording
 @a                 | Play macro a
 set wrap!          | Toggle line wrap mode
 set list!          | Show non printable characters
 ^A                 | Number increment
 ^X                 | Number decrement
 J                  | Join lines
 :noh               | Remove search highlighting
 :retab             | Convert tab to space (be careful with strings in programs)
 :retab!            | Convert space to tab (be careful with strings in programs)
 :r file            | Append content of file to current file
 :r! cmd            | Append output of "cmd" to current file
 :!cmd              | Execute command "cmd"
 :!sort             | Example: sort selected area
 :Ex                | File Explorer
 :%s/\r//g          | Delete DOS carriage returns ^M
 :%! <command>      | Run OS command on whole file
 :.! <command>      | Run OS command on current line
 :left              | Left-align line
 :right             | Right-align line
 :center            | Center line
 :redraw            | Redraw window
 :set var?          | Show current variable state
 :set ffs=unix,dos  | Recognize unix and dos end-of-line formats
 :set ffs=mac       | Recognize mac end-of-line format
 :set ff?           | Display current end-of-line format
 :set ff=unix       | Convert file to unix EOL format
 xp                 | Swap characters
 :X                 | Activate encryption, asking for key
 :setlocal cm=blowfish  | Encryption method blowfish (strong) for this file
 :set cm=blowfish   | Encryption method blowfish (strong) as default
 g ^g               | Count the words in the file
 gq                 | Format the selection regions according to textwidth (tw)
 :set tw=50         | Set the textwidth to 50 characters
 :e scp://path/file   | Edit file via SSH: scp://user@host/path/file
 :e scp://path/     | Open directory via SSH: scp://user@host/path/
 :bufdo cmd         | Execute command on every open buffer
 :tabdo cmd         | Execute command on every tab
 :bro ol            | Browse through recently used files
 :help digraphs     | Digraphs (special unicode characters)
 :dig               | Digraphs overview
 ^K                 | Digraph mode, followed by 2 characters from :dig table

Navigation
----------

 Key                | Description
--------------------|---------------------------------------------------------
 hjkl               | Cursor keys
 +                  | Jump to next line
 -                  | Jump to previous line
 w                  | Next word
 b                  | Previous word
 e                  | End of word
 H                  | Set cursor to top
 M                  | Set cursor to center
 L                  | Set cursor to bottom
 ^O                 | Navigate back
 ^I                 | Navigation forward
 )                  | Sentence forward
 (                  | Sentence backward
 *                  | Search for word under cursor
 g;                 | Goto last edit
 gi                 | Goto last edit and enter insert mode
 gf                 | Open file under cursor
 G                  | Goto end of file
 gg                 | Goto first line
 15G                | Goto line 15
 15gg               | Goto line 15
 :15                | Goto line 15
 gd                 | Goto local definition
 gD                 | Goto global definition
 [[                 | Goto previous {
 ]]                 | Goto next }
 ma                 | Mark current position as "a"
 'a                 | Goto to "a"
 %                  | Goto to matching element
 fX                 | Goto character X in line
 Fx                 | Go back to character X in line
 tX                 | Goto one character before X
 TX                 | Go back to one character before X
 ^W gf              | Open file in new tab

 Goto column 20:
``` VimL
    20|
```

Scrolling
---------

 Key                | Description
--------------------|---------------------------------------------------------
 ^U                 | Scroll half a screen up
 ^D                 | Scroll half a screen down
 ^E                 | Scroll down one line
 ^Y                 | Scroll up one line
 ^F                 | Scroll down one screen
 ^B                 | Scroll up one screen
 gk                 | Go up one line in wrapped line
 gj                 | Go down one line in wrapped line
 zt                 | Set current line to the top of the screen
 zb                 | Set current line to the bottom of the screen
 zz                 | Set current line to the center of the screen

Buffer
------

 Key                | Description
--------------------|---------------------------------------------------------
 :ls                | Show open buffer
 :1b                | Open buffer 1
 :b1                | Open buffer 1
 :bd                | Delete buffer
 :bn, :bp           | Buffer next, buffer previous
 :enew              | Create and show new buffer (new file)
 :ball              | Show all buffers on the screen

Search
------

 Key                | Description
--------------------|---------------------------------------------------------
 /pattern           | Search for pattern
 /^R"               | Use clipboard content as pattern
 /^Ra               | Search for the content of buffer a
 /^R^W              | Search for word under cursor
 ?                  | Search backwards
 n                  | Repeat search
 N                  | Repeat search backwards
 :s/old/new/g       | Search and replace in current line
 :%s/old/new/g      | Search and replace in current buffer
 :%s/old/new/gc     | Ask for confirmation before replacing (c option)
 :%s/old/new/gci    | Case insensitive
 :%s/^/hello/g      | Add "hello" to the beginning of every line
 :g/string/d        | Delete all lines containing "string"
 :v/string/d        | Delete all lines not containing "string"
 :e **/*foo*        | Search for files recursively with foo in name
 :%s//new/g         | Use last search in search and replace

Regular expressions in search and replace
-----------------------------------------

 Key                | Description
--------------------|---------------------------------------------------------
 .                  | Any character
 *                  | (0-n) times the previous character
 ?                  | (0-1) times the previous character
 \+               | (1-n) times the previous character
 \{n}               | (n) times the previous character
 \{min,max}         | (min-max) times the previous character
 ^                  | Beginning of line
 $                  | End of line
 [ ]                | e.g. [a-f]
 \( \)              | Pattern can be reused with \1, \2 ...
 \< \>              | Word begin \< and word end \>
 \s                 | Whitespace
 \S                 | Non-whitespace
 \d                 | Number
 \a                 | Character
 \w                 | Word char
 \W                 | Non-word char
 &                  | Found pattern for replace (:%s/jan/Zwiener, &/g)
 \&                 | Logical AND
 \@!                | Logical NOT. e.g.: foo but not foobar: foo\(bar\)\@!
 \r                 | New line for replace (comma to new line :%s/, /\r/)
 \v                 | Very magic: all characters have a special meaning
 \V                 | Very nomagic: Use the pattern as it is
 \x                 | Hex character: the same as [0-9a-fA-F]

Logical OR is | (pipe character/vertical bar)

Examples for regular expressions
--------------------------------

 Key                | Description
--------------------|---------------------------------------------------------
 /jo[ha]n           | Search john or joan
 /john\|joan        | Search john or joan
 /\<\d\d\d\d\>      | Search exactly 4 digits
 :%s/^\(.*\)\n\1$/\1/ | Delete duplicated lines
 /.*Bush\&.*Clinton | Search for Bush AND Clinton
 /.*Bush\|.*Clinton | Search for Bush OR Clinton
 /\v#\x{6}          | CSS Hex-Color: #00ffee (\v very magic, \x = hex)
 /\v"[^"]+"         | Search for string in ""

Split view
----------

 Key                | Description
--------------------|---------------------------------------------------------
 ^w w               | Toggle between views
 ^w v               | Vertical split
 ^w s               | Horizontal split
 ^w c               | Close split
 ^w jkhl            | Jump between views
 :only              | Close alll
 ^w r               | Rotate view
 ^w R               | Rotate view back

Visual-Mode
-----------

 Key                | Description
--------------------|---------------------------------------------------------
 v                  | Start selection
 V                  | Select lines
 gv                 | Restore last selection
 ^Q                 | Visual block-mode
 r                  | Replace
 I                  | Insert
 A                  | Append
 p                  | Paste
 u                  | Make lower-case
 U                  | Make upper-case
 g?                 | ROT13 "encryption"

Browse source code width tags (ctags)
-------------------------------------

Generate tags (database) file with a shortcut (here F11):

    map <F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

Add path for tags database to .vimrc:

    set tags=./tags,tags,./../tags,./../../tags,./../../../tags

 Key                | Description
--------------------|---------------------------------------------------------
 :tag main          | Goto tag "main"
 :tn                | Goto next tag
 :tp                | Goto previous tag
 :ts main           | Search for "main"

Search in files
---------------

 Key                | Description
--------------------|---------------------------------------------------------
 :cd                | Show current directory
 :cd Verz           | Change current directoy
 :vimgrep /{pattern}/[g][j] {file} | Search for pattern in current directory
 :noautocmd vimgrep /{pattern}/[g][j] {file} | Fast search (disable autocmds)
 :noautocmd vimgrep /{pattern}/j **/*.c | Recursive search
 :copen             | Display search results
 :cclose            | Close search results
 :colder            | Display older search results
 :cnewer            | Display newer search results

Option g, j:
g = Show all matches (recommended)
j = Don't jump to first match

Spell check
-----------

 Key                | Description
--------------------|---------------------------------------------------------
 :set spell!        | Toggle spell check
 :set spelllang=de  | Activate German spell check
 z=                 | Correct word
 ]s                 | Next item
 [s                 | Previous item
 zg                 | Add word to dictionary

Folds
-----

 Key                | Description
--------------------|---------------------------------------------------------
 :set folding=syntax| Activate folding with "syntax" method
 zi                 | Toggle folds
 zv                 | Show current position
 zm                 | Close fold
 zM                 | Close all folds
 zr                 | Open fold
 zR                 | Open all folds

Macro
-----

Example: IP address auto-generate

``` VimL
    :for i in range(1,10) | put ='192.168.0.'.i | endfor
```

UTF-8 with Vim
--------------

 Key                | Description
--------------------|---------------------------------------------------------
 :set enc=cp850     | Use cp850 encoding for the current file (or cp437 for MS-DOS)
 :set enc=latin1    | Use latin1 encoding for the current file
 :set enc=utf-8     | Use utf-8 encoding for the current file
 :set fenc=utf-8    | The next :w will write the file utf-8 encoded
 :set bomb          | Activates a BOM for the next write
 :e ++enc=<encoding>| Reload file with another encoding

Example:

A file is latin1 encoded and is loaded in Vim, i.e. :set enc? results in
"latin1" and the file is displayed correctly in Vim. Now we want to convert the
file to utf-8.  Do :set fenc=utf-8 and write the file :w.  Reload the file with
the correct encoding: :e ++enc=<utf-8>.

