#!/usr/bin/env zsh

DEPENDENCES_ARCH+=(xclip)
DEPENDENCES_DEBIAN+=(xclip)

if [[ "$OSTYPE" == darwin* ]]; then
  alias o='open'
  function clip(){
    if [[ ! -t 0 ]]; then
        pbcopy
      else
        pbpaste
    fi
  }
elif [[ "$OSTYPE" == cygwin* ]]; then
  alias open='cygstart'
  alias o='cygstart'
  alias pbcopy='tee > /dev/clipboard'
  alias pbpaste='cat /dev/clipboard'
  function clip(){
    if [[ ! -t 0 ]]; then
      tee > /dev/clipboard
    else
      cat /dev/clipboard
    fi
  }
else
  alias open='xdg-open'
  alias o='xdg-open'
  alias pbcopy='xclip -selection clipboard -in'
  alias pbpaste='xclip -selection clipboard -out'
  function clip(){
    if [[ ! -t 0 ]]; then
        xclip -selection clipboard -in
      else
        xclip -selection clipboard -out
    fi
  }
fi
