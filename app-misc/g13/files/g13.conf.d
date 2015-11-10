# /etc/conf.d/g13: configuration for /etc/init.d/g13

# Arguments to pass to g13: g13 <logo>
#
G13_ARGS="/usr/share/g13/logo.lpbm"

###
#   Note that only one of either writing a message to the LCD or
#   loading default bindings can be done at startup due to a race
#   in the parser.
###

# Message to be written to the G13 LCD on startup
G13_LCDMSG="Welcome to\n  Gentoo"

# Default key bindings to be sent to the G13 on startup
#G13_BINDFILE="/etc/g13.bind"
