#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# LDA start Sway
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	# Without this Firefox is run with XWayland.
	export MOZ_ENABLE_WAYLAND=1
	# https://github.com/swaywm/sway/wiki#xdg_current_desktop-environment-variable-is-not-being-set
	export XDG_CURRENT_DESKTOP=sway

	if [ `hostname` = "starluc" ]; then
		# https://wiki.archlinux.org/title/Wayland#Qt
		export QT_QPA_PLATFORM=wayland
		# See https://wiki.archlinux.org/title/Hardware_video_acceleration#Configuring_VA-API
		export LIBVA_DRIVER_NAME=iHD
	fi

  	exec sway
fi
