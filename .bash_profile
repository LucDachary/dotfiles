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
	#
	# https://wiki.archlinux.org/title/Wayland#Qt
	export QT_QPA_PLATFORM="wayland;xcb"

	# https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/portal.nix#L53
	export GTK_USE_PORTAL=1

	# FZF with RipGrep
	# https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
	if type rg &> /dev/null; then
		export FZF_DEFAULT_COMMAND='rg --files'
		export FZF_DEFAULT_OPTS='-m --height 50% --border'
	fi

	# To fix `texlive-core` installation. See STARLUC's journal.
	alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

	if [ `hostname` = "starluc" ]; then
		# See https://wiki.archlinux.org/title/Hardware_video_acceleration#Configuring_VA-API
		export LIBVA_DRIVER_NAME=iHD
	fi

  	exec sway
fi
