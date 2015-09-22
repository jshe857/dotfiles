#! /bin/sh
xrdb ~/.Xresources

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

/usr/bin/xdg-user-dirs-update
synclient HorizTwoFingerScroll=0
case $1 in
	bspwm)
	xsetroot -cursor_name left_ptr &
	sxhkd &
	feh --randomize --bg-fill ~/wallpapers/* &
	wmname LG3D &
	mpd &
	exec bspwm 2> ~/.bspwm.log
	;;
	*)
	exec $1
	;;
esac
