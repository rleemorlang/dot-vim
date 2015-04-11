## Environment

### GTK Configuration

Put this in ~/.gtkrc-2.0:

  # color the right and bottom edges of maximized gvim windows
  style "gvim" {
      bg[NORMAL] = "#002b36"
  }
  widget "vim-main-window.*.GtkForm" style "gvim"

## Plugin Notes

### [solarized](https://github.com/altercation/vim-colors-solarized)
* change mode with `set background=light`
* for proper terminal colors, see https://github.com/ghuntley/terminator-solarized


