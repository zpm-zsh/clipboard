# Clipboard

Zsh clipboard plugin who adds cross-platform helper functions to access the system clipboard. Works on macOS, X11 (and Wayland) and Cygwin


1. pbcopy - pipe to this function something `echo Hello world | pbcopy` and this will be copied to system clipboard. 
2. pbcopy - show content of system clipboard `pbpaste | grep Hello`. 
3. clip - a wrapper around 2 previous functions, if you didn't pipe to it something function will show clipboard content otherwise will copy to clipboard.
