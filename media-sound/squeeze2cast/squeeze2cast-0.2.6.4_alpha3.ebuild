# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit git-r3

DESCRIPTION="Helper for Chromecast devices to be used in Logitech Media Server"
HOMEPAGE="https://github.com/philippe44/LMS-to-cast"
EGIT_REPO_URI="https://github.com/philippe44/LMS-to-Cast.git"
# aka: 0.2.6.4-dev-3
EGIT_COMMIT="fbb0297dcafe5ba3a5f0edcecf58329f21714b8b"

LICENSE="MIT GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/jansson
	dev-libs/nanopb
	dev-libs/openssl
	>=dev-util/valgrind-3.12.0
	>=net-dns/mdnssd-20170108
	~net-libs/libupnp-castbridge-1.6.19
"
RDEPEND="${DEPEND}"

DOCS="README.md CHANGELOG doc/userguide.htm"

S="${WORKDIR}/${P}/application/${PN}"

suffix()
{
	use amd64 && echo 'x86-64' || echo 'x86'
}

src_prepare() {
	cp ${FILESDIR}/Makefile.gentoo ${S}/Makefile
	eapply_user
}

src_install() {
	newbin squeeze2cast squeeze2cast-$(suffix)
}

pkg_postinst() {
	elog "Support thread for LMS-Cast/${PN} is at:"
	elog "   http://forums.slimdevices.com/showthread.php?104614-Announce-CastBridge-integrate-Chromecast-players-with-LMS-(squeeze2cast)&p=835640&viewfull=1#post835640"
}
