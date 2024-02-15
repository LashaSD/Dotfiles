# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias || true
alias matrix='cmatrix -s -C Magenta'
alias PolyBarConfig='python3 ~/.config/polybar/config.py'
#alias vim='nvim'
alias copy='xclip -selection clipboard'
alias cv='cat solve.cpp | xclip -selection clipboard'
alias c='g++ -s -O3 -o solve solve.cpp && ./solve'
eval "$(starship init bash)"

if command -v wal > /dev/null  2>&1 && [ "$TERM" = "alacritty" ]; then
    wal -Rqe
fi

. /usr/share/autojump/autojump.bash
