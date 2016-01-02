# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils git-r3

DESCRIPTION="Logitech Media Server plugin for Chromecast devices"
HOMEPAGE="https://github.com/philippe44/LMS-to-cast"
EGIT_REPO_URI="https://github.com/philippe44/LMS-to-Cast.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-sound/logitechmediaserver-bin
	=net-libs/libupnp-castbridge-1.6.19
"
RDEPEND="${DEPEND}"

INSTALL_DIR="/var/lib/logitechmediaserver/Plugins/CastBridge"

src_install() {
	dodoc CHANGELOG README.md
	insinto ${INSTALL_DIR}
	cd plugin
	doins Plugin.pm Settings.pm Squeeze2cast.pm install.xml strings.txt
	doins -r HTML
	fowners logitechmediaserver:logitechmediaserver ${INSTALL_DIR} -R
}

pkg_postinst() {
	elog "Castbridge has been installed to ${INSTALL_DIR} - now:"
	elog " 1. restart logitechmediaserver, check /var/log/logitechmediaserver/server.log"
	elog ""
	elog "Support thread at: http://forums.slimdevices.com/showthread.php?104614-Announce-CastBridge-integrate-Chromecast-players-with-LMS-(squeeze2cast)"
}
