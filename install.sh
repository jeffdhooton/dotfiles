#!/bin/bash

### nvim ###
mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"
ln -sf "$DOTFILES/nvim/init.lua" "$XDG_CONFIG_HOME/nvim"
rm -rf "$XDG_CONFIG_HOME/nvim/lua"
ln -s "$DOTFILES/nvim/lua" "$XDG_CONFIG_HOME/nvim/lua"

### X11 ###
rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"

### i3 ###
rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

### polkit ###
rm -rf "$XDG_CONFIG_HOME/systemd"
ln -s "$DOTFILES/systemd" "$XDG_CONFIG_HOME"

## polybar
rm -rf "$XDG_CONFIG_HOME/polybar"
ln -s "$DOTFILES/polybar" "$XDG_CONFIG_HOME"

### zsh ###
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

### fonts ###
mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

### dunst ###
mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"

### tmux ###
mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

### picom ###
mkdir -p "$XDG_CONFIG_HOME/picom"
ln -sf "$DOTFILES/picom/picom.conf" "$XDG_CONFIG_HOME/picom/picom.conf"

[ ! -d "$XDG_CONFIG_HOME/tmux/plugins/tpm" ] \
	&& git clone https://github.com/tmux-plugins/tpm \
	"$XDG_CONFIG_HOME/tmux/plugins/tpm"

