# Merge xresources file
xrdb -merge ~/dotfiles/X11/.Xresources

# Start GNOME keyring
systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Start i3
exec i3
