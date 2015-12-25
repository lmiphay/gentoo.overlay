# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils git-r3

DESCRIPTION="Helper to allow Chromecast devices to be used in Logitech Media Server"
HOMEPAGE="https://github.com/philippe44/LMS-to-cast"
EGIT_REPO_URI="https://github.com/philippe44/LMS-to-Cast.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/jansson
	dev-libs/nanopb
	dev-libs/openssl
	=net-libs/libupnp-1.6.19
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/application"

src_prepare() {
	cp ${FILESDIR}/Makefile.gentoo ${WORKDIR}/${P}/application/Makefile
	epatch_user
}

src_install() {
	dobin build/squeeze2cast
	dohtml doc/userguide.htm
}
