#!/sbin/openrc-run
# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

description="Simple management UI for Docker"

user="portainer:portainer"

log="/var/log/portainer.log"
errorlog="/var/log/portainer.errors"

start_stop_daemon_args="--user $user --stdout $log --stderr $errorlog --retry 20"

command="/opt/portainer-bin/portainer"
command_args="
	--data /var/lib/portainer/data 
	--no-analytics
	--template-file /var/lib/portainer/templates.json
	${PORTAINER_OPTS}
"

command_background=yes
pidfile=/run/portainer.pid

depend() {
    need net
    after bootmisc
}

start_pre() {
    checkpath --file --owner $user --mode 0644 $log
    checkpath --file --owner $user --mode 0644 $errorlog
}
