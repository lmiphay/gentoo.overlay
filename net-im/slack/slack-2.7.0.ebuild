# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils rpm

DESCRIPTION="A messaging app for teams"
HOMEPAGE="https://slack.com/"
SRC_URI="https://downloads.slack-edge.com/linux_releases/${P}-0.1.fc21.x86_64.rpm"
LICENSE="Slack"
RESTRICT="mirror"

SLOT="0"
KEYWORDS="~amd64 -*"
IUSE="plasma"

QA_PREBUILT="usr/lib/slack/*"

DEPEND=""
RDEPEND="
	plasma? ( kde-plasma/plasma-desktop[legacy-systray,gtk2] )
	>=gnome-base/gconf-3.2.6-r4
	>=gnome-base/libgnome-keyring-3.12.0
	>=x11-libs/libXScrnSaver-1.2.2-r1
"

S=${WORKDIR}

src_unpack() {
	rpm_unpack ${A}
}

src_prepare() {
	rm etc/cron.daily/slack \
	   usr/lib/slack/LICENSE
	eapply_user
}

src_install() {
	cp -a . "${D}" || die
	make_desktop_entry ${PN} "Slack" /usr/share/pixmaps/${PN}.png "Network"
}
