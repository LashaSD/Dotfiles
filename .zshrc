# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

local NEOVIDE_BIN="neovide.exe"
nev() {
    local DIR=$(realpath $PWD)
    if [ -n "$1" ]; then
        DIR=$(realpath "$1")
    fi

    powershell.exe -Command "$NEOVIDE_BIN" --wsl "$DIR"
}

test -s ~/.alias && . ~/.alias || true
alias nv='nvim'
alias cv='cat solve.cpp | xclip -sel clipboard'
alias c='g++ -DLASHA_LOCAL -s -O3 -o solve solve.cpp'
alias cr='g++ -DLASHA_LOCAL -s -O3 -o solve solve.cpp && ./solve'
alias rblx='~/.scripts/rblx.sh'

if command -v wal > /dev/null  2>&1 && [ "$TERM" = "alacritty" ]; then
	wal -Rqe
fi

. "$HOME/.rokit/env"

source ~/Dotfiles/starship.zsh
eval "$(starship init zsh)"
. /usr/share/autojump/autojump.zsh
