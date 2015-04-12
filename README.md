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

### [ctrlp](https://github.com/kien/ctrlp.vim)

* ctrl-p to open. once open:
** ctrl-d for filename only mode
** ctrl-r for regexp mode
** ctrl-j/k to navigate
** ctrl-t/v/x to open in new tab/split
** ctrl-z to mark multiple, ctrl-o to open

### [multiple-cursors](https://github.com/terryma/vim-multiple-cursors.git)
* ctrl-n when over a word to highlight, again to highlight next
* ctrl-p to unhighlight
* ctrl-x to skip

### [solarized](https://github.com/altercation/vim-colors-solarized)
* change mode with `set background=light`
* for proper terminal colors, see https://github.com/ghuntley/terminator-solarized


