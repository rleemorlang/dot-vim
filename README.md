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

### [unimpaired](https://github.com/tpope/vim-unimpaired.git)
* `]e` or `[e` to move the current line up/down
* `]<space>` or `[<space>` to add lines above or below
* others...


