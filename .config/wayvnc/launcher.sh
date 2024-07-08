#!/bin/bash
#export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
#export WAYLAND_DISPLAY=wayland-1
#export WLR_BACKENDS=headless \
#export WLR_LIBINPUT_NO_DEVICES=1 \
# export XDG_RUNTIME_DIR=/tmp/wayvnc-sway
export XDG_RUNTIME_DIR=/run/user/1000
#export XDG_SESSION_DESKTOP="sway"
#export XDG_SESSION_TYPE="wayland"

# mkdir -p "$XDG_RUNTIME_DIR"

# Fix from https://github.com/swaywm/sway/issues/3769, should be temporary
# sway --get-socketpath
#export SWAYSOCK=$(fd sway-ipc.*sock / | head -n 1)

# https://www.reddit.com/r/swaywm/comments/svyx94/unable_to_retrieve_socket_path_with_sway_systemd/
#systemctl --user import-environment SWAYSOCK

#WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
#	WLR_BACKENDS=headless \
#	WLR_LIBINPUT_NO_DEVICES=1 \
#	DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS \
#swaymsg --socket /tmp/sway-ipc.*.sock exec \
#	'WAYLAND_DISPLAY=wayland-1 wayvnc --config /home/luc/.config/wayvnc/config \
#	--max-fps=60 \
#	--gpu \
#	--performance \
#	127.0.0.1'

# https://www.baeldung.com/linux/systemd-session-dbus-headless-setup
if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    # Only start D-Bus if it's not already running
    eval `dbus-launch --sh-syntax --exit-with-session`

		systemctl --user set-environment DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus
fi

WAYLAND_DISPLAY=wayland-1 wayvnc --config /home/luc/.config/wayvnc/config \
	--max-fps=60 \
	--gpu \
	--performance \
	127.0.0.1 &
