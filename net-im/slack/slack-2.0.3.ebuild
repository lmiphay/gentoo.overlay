# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils rpm

DESCRIPTION="A messaging app for teams"
HOMEPAGE="https://slack.com/"
SRC_URI="https://downloads.slack-edge.com/linux_releases/slack-2.0.3-0.1.fc21.x86_64.rpm"
LICENSE="Slack"

SLOT="0"
KEYWORDS="~amd64 -*"
IUSE=""

DEPEND=""
RDEPEND="
	gnome-base/gconf
	x11-libs/libXScrnSaver
"

S=${WORKDIR}

src_unpack() {
	rpm_unpack ${A}
}

src_install(){
	cp -a . "${D}" || die
	#make_desktop_entry ${PN} "Slack" /usr/share/pixmaps/${PN}.png "Network"
}

pkg_postinst() {
	elog "Installed"
}
