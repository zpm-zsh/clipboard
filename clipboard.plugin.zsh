#!/usr/bin/env zsh

DEPENDENCES_ARCH+=(xclip)
DEPENDENCES_DEBIAN+=(xclip)

if (( $+commands[xdg-open] )); then
  alias open='xdg-open'
  alias o='xdg-open'
  alias pbcopy='xclip -selection clipboard -in'
  alias pbpaste='xclip -selection clipboard -out'
  function clip() {
    if [[ ! -t 0 ]]; then
      xclip -selection clipboard -in
    else
      xclip -selection clipboard -out
    fi
  }
elif [[ "$OSTYPE" == darwin* ]]; then
  alias o='open'
  function clip() {
    if [[ ! -t 0 ]]; then
      pbcopy
    else
      pbpaste
    fi
  }
elif [[ "$OSTYPE" == (cygwin*|msys) ]]; then
  if [[ $OSTYPE == cygwin* ]]; then
    alias open='cygstart'
    alias o='cygstart'
  else
    alias open='explorer'
    alias o='explorer'
  fi
  alias pbcopy='tee > /dev/clipboard'
  alias pbpaste='cat /dev/clipboard'
  function clip() {
    if [[ ! -t 0 ]]; then
      tee > /dev/clipboard
    else
      cat /dev/clipboard
    fi
  }
  # WSL
elif [[ $OSTYPE == linux* ]] && [[ -r /proc/version ]] && [[ $(< /proc/version) == *Microsoft* ]] \
  && ! xclip -o &> /dev/null; then
  alias open='explorer.exe'
  alias o='explorer.exe'
  alias pbcopy='clip.exe'
  alias pbpaste='powershell.exe -Command Get-Clipboard'
  function clip() {
    if [[ ! -t 0   ]]; then
      clip.exe
    else
      powershell.exe -Command Get-Clipboard
    fi
  }
fi
