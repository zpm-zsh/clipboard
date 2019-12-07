# Clipboard

Zsh clipboard plugin that adds cross-platform helper functions to access the system clipboard. Works on macOS, X11 (and Wayland), Cygwin, MSYS2, and WSL.


1. `pbcopy` - pipe something to this function, e.g. `echo Hello world | pbcopy`, and it will be copied to system clipboard. 
2. `pbpaste` - show the contents of the system clipboard, e.g. `pbpaste | grep Hello`. 
3. `clip` - a wrapper around the two previous functions. If you do not pipe something to it, the function will show the clipboard contents; otherwise, it will copy something to the clipboard.
