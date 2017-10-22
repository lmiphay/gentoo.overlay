# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# /etc/conf.d/squeezeslave: configuration for /etc/init.d/squeezelite

# Switches to pass to Squeezelite. See 'squeezelite -h' for
# a description of the possible switches.
#
# Example setting the server IP, the ALSA output device, the player name
# and visualiser support:
# SL_OPTS="-s 192.168.1.56 -o sysdefault -n $HOSTNAME"
#
SL_OPTS=""
