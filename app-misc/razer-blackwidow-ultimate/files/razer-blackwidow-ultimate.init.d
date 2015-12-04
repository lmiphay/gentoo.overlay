#!/sbin/openrc-run
# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

description="Enable M1-M5/FN keys for the Razer BlackWidow Ultimate keyboard"

depend()
{
	need localmount
	after bootmisc
}

start()
{
	/usr/sbin/razer-blackwidow-ultimate >> /var/log/razer-blackwidow-ultimate.log 2>&1
}
