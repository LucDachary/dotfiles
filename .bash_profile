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
  	exec sway
fi
