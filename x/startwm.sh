#!/bin/sh
if [ -r /etc/default/locale ]; then
	. /etc/default/locale
	export LANG LANGUAGE
fi
xrdb -merge ~/.Xresources
/usr/bin/i3
