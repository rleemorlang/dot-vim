## Environment

### GTK Configuration

Put this in ~/.gtkrc-2.0:

    # color the right and bottom edges of maximized gvim windows
    style "gvim" {
        bg[NORMAL] = "#002b36"
    }
    widget "vim-main-window.*.GtkForm" style "gvim"

## ctags

    apt-get install exuberant-ctags

## Plugin Notes

### [coffee-script](git@github.com:kchmck/vim-coffee-script)
* `CoffeeCompile` or `CoffeeCompile vert`
* `CoffeeWatch` or `CoffeeWatch vert`
* may want to try `setl scrollbind` on each buffer
* `CoffeeRun`
* `CoffeeLint`

### [commentary](git://github.com/tpope/vim-commentary.git)
* `gcc` to toggle commenting on the current line
* `gcap` to comment a paragraph
* `autocmd FileType apache set commentstring=#\ %s`

### [ctrlp](https://github.com/kien/ctrlp.vim)
* ctrl-p to open. once open:
** ctrl-d for filename only mode
** ctrl-r for regexp mode
** ctrl-j/k to navigate
** ctrl-t/v/x to open in new tab/split
** ctrl-z to mark multiple, ctrl-o to open

### [easy-align](https://github.com/junegunn/vim-easy-align)
* hit enter on a selection in visual mode
* or something like `gaip=` to align around `=` for the current paragraph
* use `<c-x>` to supply a regular expression
* use `<c-p>` to enter "live interactive mode", if using regexes you can
  hit `<c-x>` a second time to see the result of the regex
* prefix a delimiter a number to align around the nth delimiter
* with `-` to align around the last delimiter
* with `*` to align around all delimiters
* with `-<num>` to align around the nth-last delimiter
* try "-<space>" to align in-line comments

### [easymotion](https://github.com/Lokaltog/vim-easymotion.git)

### [gundo](http://github.com/sjl/gundo.vim.git)
** `,,u` to open

### [multiple-cursors](https://github.com/terryma/vim-multiple-cursors.git)
* ctrl-n when over a word to highlight, again to highlight next
* ctrl-p to unhighlight
* ctrl-x to skip

### [solarized](https://github.com/altercation/vim-colors-solarized)
* change mode with `set background=light`
* for proper terminal colors, see https://github.com/ghuntley/terminator-solarized

### [syntastic](https://github.com/scrooloose/syntastic.git)

### [tern](https://github.com/marijnh/tern_for_vim)
After cloning:

    cd ~/.vim/bundle/tern
    npm install

### [ultisnips](https://github.com/SirVer/ultisnips)
* `c-k` to complete the match and/or move to the next stop
* `c-h` to list completions
* `s-c-j` to move back
* :UltiSnips<editsomething> to edit the snips for the current filetype

### [unimpaired](https://github.com/tpope/vim-unimpaired.git)
* `]e` or `[e` to move the current line up/down
* `]<space>` or `[<space>` to add lines above or below
* others...

### [youcompleteme](https://github.com/Valloric/YouCompleteMe#full-installation-guide)
Needs a `git submodule update --init --recursive` to pull down its sub-deps.

Also needs 

    sudo apt-get install cmake python-dev`
    cd /tmp
    mkdir yvm_build
    mkdir ycm_build
    cd ycm_build
    cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    make ycm_support_libs


