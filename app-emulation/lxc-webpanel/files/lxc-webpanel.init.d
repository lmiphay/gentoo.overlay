#!/sbin/openrc-run
# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

description="LXC Web Panel"

logfile="/var/log/lxc-webpanel.log"
command="/usr/bin/python2"
command_args="lwp.py"
start_stop_daemon_args="--chdir /usr/share/lxc-webpanel --stdout $logfile --stderr $logfile"

command_background=yes
pidfile=/run/lxc-webpanel.pid

depend() {
    need net
    after bootmisc
}
