#!/bin/sh

userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

#if [ -e "$XDG_PICTURES_DIR/wallpapers/wallpaper" ]; then
#	display -window root "$XDG_PICTURES_DIR/wallpapers/wallpaper" &
#else 
#	shufwall &
#fi

#clipmenud &
fcitx5 -d
redshift &
# udiskie recommanded to auto start here in .xinitrc, see:
# https://github.com/coldfix/udiskie/issues/93
# https://github.com/coldfix/udiskie/issues/226
udiskie &
# default fastest windows 10 keyboard repeat delay and rate
# without editing registry, using filter key, or other third party program
# see http://stereopsis.com/keyrepeat/
xset r rate 250 30
# https://dianne.skoll.ca/wiki/Remind_FAQ#How_can_I_generate_popup_windows_to_warn_me_of_timed_reminders.3F
rem -z -k'notify-send -u critical "reminder" %s &' &
if [ "$(envycontrol --status)" = 'Current graphics mode is: nvidia' ]; then
	# my testing shows this seems no need?
	xrandr --setprovideroutputsource modesetting NVIDIA-0
	xrandr --auto
	# xorg-server 21.1.1-2 set correct dpi for my computer, but I choose to take the blue pill
	# Attention, don't use & at the end otherwise dwm status bar won't have proper dpi.
	# xorg-server 21.1.1-3 "fixed" it, so no need now
	# but nvidia driver need it now
	xrandr --dpi 96
fi
sbar &
alacritty &
exec dwm
