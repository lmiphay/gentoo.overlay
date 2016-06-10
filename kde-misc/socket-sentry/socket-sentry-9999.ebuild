# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

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
