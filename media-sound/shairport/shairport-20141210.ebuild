# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit eutils user git-r3

DESCRIPTION="Emulates an AirPort Express to stream music from i-devices"
HOMEPAGE="http://www.mafipulation.org"

EGIT_REPO_URI="https://github.com/abrasive/shairport.git"
EGIT_COMMIT="d65b8e86e3048181d7c002bada4d879ee49f3f84"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/openssl
	media-libs/libao"
RDEPEND="${DEPEND}
	net-dns/avahi"

pkg_setup() {
	enewuser shairport -1 -1 -1 audio
}

src_install() {
	dobin shairport
	dodoc README.md
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
	newinitd "${FILESDIR}"/${PN}.initd ${PN}
}
