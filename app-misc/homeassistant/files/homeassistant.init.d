#!/sbin/openrc-run
# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

description="Open-source home automation platform"

user="homeassistant:homeassistant"
logfile="/var/log/homeassistant/homeassistant.log"

start_stop_daemon_args="--user $user"

command="/opt/homeassistant-bin/bin/hass"
command_args="
	--config /etc/homeassistant
	--pid-file /run/homeassistant.pid
	--log-file $logfile
        ${HASS_OPTS}
"

command_background=yes
pidfile=/run/homeassistant.pid

depend() {
    need net
    after bootmisc
}

start_pre() {
    checkpath --file --owner $user --mode 0644 $logfile
}
