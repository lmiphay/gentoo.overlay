# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils git-r3

DESCRIPTION="Logitech Media Server plugin for Chromecast devices"
HOMEPAGE="https://github.com/philippe44/LMS-to-cast"
EGIT_REPO_URI="https://github.com/philippe44/LMS-to-Cast.git"
# aka: 0.2.6.4-dev-3
EGIT_COMMIT="fbb0297dcafe5ba3a5f0edcecf58329f21714b8b"

LICENSE="MIT GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-sound/logitechmediaserver-bin
	=media-sound/squeeze2cast-${PV}
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
	elog " 2. wait a minute or two the devices to be discovered"
	elog ""
	elog "Support thread for LMS-Cast/${PN} is at:"
	elog "   http://forums.slimdevices.com/showthread.php?104614-Announce-CastBridge-integrate-Chromecast-players-with-LMS-(squeeze2cast)&p=835640&viewfull=1#post835640"
}
