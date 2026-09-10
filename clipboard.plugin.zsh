#!/usr/bin/env zsh
# Standarized ZSH polyfills, following:
# https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

if [[ $PMSPEC != *f* ]] {
  fpath+=( "${0:h}/functions" )
}

autoload -Uz open pbcopy pbpaste clip

if [[ -n "$WAYLAND_DISPLAY" ]]; then
  DEPENDENCES_ARCH+=(wl-clipboard)
  DEPENDENCES_DEBIAN+=(wl-clipboard)
else
  DEPENDENCES_ARCH+=(xclip)
  DEPENDENCES_DEBIAN+=(xclip)
fi
