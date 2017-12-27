#!/sbin/openrc-run
# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

description="Philips Hue emulator for Alexa"

user="ha-bridge:ha-bridge"

stdoutlog="/var/log/ha-bridge/stdout.log"
stderrlog="/var/log/ha-bridge/stderr.log"

start_stop_daemon_args="--chdir /var/lib/ha-bridge --user $user --stdout $stdoutlog --stderr $stderrlog"

command="/usr/bin/ha-bridge"
command_args="${HA_BRIDGE_OPTS}"

command_background=yes
pidfile=/run/ha-bridge.pid

depend() {
    need net
    after bootmisc
}

start_pre() {
    checkpath --directory --owner $user --mode 0770 /var/lib/ha-bridge
    checkpath --file --owner $user --mode 0644 $stdoutlog
    checkpath --file --owner $user --mode 0644 $stderrlog
}
