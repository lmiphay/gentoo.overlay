#!/sbin/openrc-run
# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

description="Enable the Razer BlackWidow Ultimate M1-M5 keys"

depend()
{
	need localmount
	after bootmisc
}

start()
{
	if [ -n "$RBU_START_ARGS" ] ; then
	   /usr/sbin/rbu $RBU_START_ARGS
	fi
}

stop()
{
	if [ -n "$RBU_STOP_ARGS" ] ; then
	   /usr/sbin/rbu $RBU_STOP_ARGS
	fi
}
