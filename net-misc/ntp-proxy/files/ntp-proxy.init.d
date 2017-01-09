#!/sbin/openrc-run
# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

description="Leap second simulation daemon"

logfile="/var/log/ntp-log.log"

command="/usr/sbin/ntpproxy"
command_args="${NTP_PROXY_ARGS}"
start_stop_daemon_args="--stdout $logfile --stderr $logfile"

command_background=yes
pidfile=/run/ntp-proxy.pid

depend() {
	need net
	after bootmisc
	provide ntp-proxy
}
