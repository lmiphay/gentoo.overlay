# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils user kde4-base git-r3

DESCRIPTION="Real-time network traffic monitor for KDE Plasma."
HOMEPAGE="http://kde-apps.org/content/show.php/Socket+Sentry?content=122348"
EGIT_REPO_URI="https://github.com/lmiphay/socket-sentry.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	$(add_kdebase_dep plasma-workspace)
	net-libs/libpcap
"
RDEPEND="${DEPEND}
"

pkg_setup() {
	enewgroup socketsentry
}

src_prepare() {
	epatch "${FILESDIR}/CMakeLists.patch"
	kde4-base_src_prepare
}
