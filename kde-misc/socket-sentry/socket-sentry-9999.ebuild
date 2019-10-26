# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils user kde5 git-r3

DESCRIPTION="Real-time network traffic monitor for KDE Plasma"
HOMEPAGE="https://github.com/rhasselbaum/socket-sentry"
EGIT_REPO_URI="https://github.com/rhasselbaum/socket-sentry.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	$(add_plasma_dep plasma-workspace)
	net-libs/libpcap
"
RDEPEND="${DEPEND}
"

pkg_setup() {
	enewgroup socketsentry
}
