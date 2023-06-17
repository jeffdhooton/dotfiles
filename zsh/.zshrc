source "$XDG_CONFIG_HOME/zsh/aliases"

setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

### autocomplete ###
autoload -U compinit; compinit

# add auto complete to hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh
fpath=($ZDOTDIR/external $fpath)

autoload -Uz prompt_purification_setup; prompt_purification_setup

# push current dir on stack
setopt AUTO_PUSHD

# dont store dupes on stack
setopt PUSHD_IGNORE_DUPS

# dont print dir stack
setopt PUSHD_SILENT

bindkey -v
export KEYTIMEOUT=1

autoload -Uz cursor_mode && cursor_mode

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'i' vi-down-line-or-history

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/external/bd.zsh

source $DOTFILES/zsh/scripts.sh

# FZF
if [ $(command -v "fzf") ]; then
	source /usr/share/fzf/completion.zsh
	source /usr/share/fzf/key-bindings.zsh
fi

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi


bindkey -r '^1'
bindkey -r '^g'
bindkey -s '^g' clear-screen

export PATH="/home/jeff/.cargo/bin:$PATH"
export PATH="/home/jeff/workspace/Odin:$PATH"

# pnpm
export PNPM_HOME="/home/jeff/.config/local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
