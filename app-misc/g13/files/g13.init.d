#!/sbin/openrc-run
# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

description="libusb driver for the g13"

user="g13:plugdev"

cmdpipe="/run/g13-0"
logfile="/var/log/g13.log"

start_stop_daemon_args="--user $user --stdout $logfile --stderr $logfile"

command="/usr/sbin/g13d"
command_args="
        ${G13_ARGS}
"

command_background=yes
pidfile=/run/g13.pid

stopsig="SIGINT"
 
depend()
{
    need localmount
    after bootmisc
    provide g13
}

start_pre()
{
    checkpath --pipe --owner $user --mode 0660 $cmdpipe
    checkpath --file --owner $user --mode 0644 $logfile
    
    [ -c /dev/uinput ] || modprobe -q uinput
    if [ $? -ne 0 ]; then
       eerror "No uinput support available in kernel"
       return 1
    fi
}

start_post()
{
    g13writelcd "$G13_LCDMSG"
}
