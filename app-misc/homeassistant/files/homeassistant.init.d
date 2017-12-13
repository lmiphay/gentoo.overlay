#!/sbin/openrc-run
# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

description="Open-source home automation platform"

user="homeassistant:homeassistant"
logfile="/var/log/homeassistant.log"
errorslog="/var/log/homeassistant-errors.log"

start_stop_daemon_args="--user $user --stdout $logfile --stderr $errorslog --retry 10"

command="/opt/homeassistant/bin/hass"
command_args="
	--skip-pip
	--config /etc/homeassistant
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
    checkpath --file --owner $user --mode 0644 $errorslog
}
