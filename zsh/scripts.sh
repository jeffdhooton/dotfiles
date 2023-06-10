#!/bin/zsh

compress() {
	tar vczf $1.tar.gz $1
}

ftmuxp() {
	if [[ -n $TMUX ]]; then
		return
	fi

	# Get the IDs
	ID="$(ls $XDG_CONFIG_HOME/tmuxp | sed -e 's/\.yml$//')"
	if [[ -z "$ID" ]]: then
		tmux new-session
	fi

	create_new_session="Create New Session"

	ID="${create_new_session}\n$ID"
	ID="$(echo $ID | fzf | cut -d: -f1)"

	if [[ "$ID" = "${create_new_session}" ]]; then
		tmus new-session
	elif [[ -n "$ID" ]]; then
		# Rename the current urxvt tab to session name
		printf '\033]777;tabbedx;set_tab_name;%s\007' "$ID"
		tmuxp load "$ID"
	fi
}

wikipedia() {
	lynx -vikeys -accept_all_cookies "https://en.wikipedia.org/wiki?search=$@"
}

duckduckgo() {
	lynx -vikeys -accept_all_cookies "https://lite.duckduckgo.com/lite/?q='$@'"
}
