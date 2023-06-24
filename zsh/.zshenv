# dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# cache
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# history
export HISTFILE="$ZDOTDIR/.zhistory"

# max events internal
export HISTSIZE=10000

# max events in history file
export SAVEHIST=10000

# dotfiles
export DOTFILES="$HOME/dotfiles"

export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GOPATH="$HOME/go"

export PATH

. "$HOME/.cargo/env"
