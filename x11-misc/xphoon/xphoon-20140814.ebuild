# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit toolchain-funcs

DESCRIPTION="sets X the root window to a picture of the moon in its current phase"
HOMEPAGE="http://acme.com/software/xphoon/"

MY_PV="14Aug2014"
SRC_URI="http://acme.com/software/${PN}/${PN}_${MY_PV}.tar.gz"
RESTRICT="mirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-misc/xbitmaps
"
DEPEND="${RDEPEND}
	x11-misc/imake"

S="${WORKDIR}/${PN}"

src_configure() {
	xmkmf || die
}

src_compile() {
	emake CC="$(tc-getCC)" CCOPTIONS="${CFLAGS}" EXTRA_LDOPTIONS="${LDFLAGS}" || die
}

src_install() {
	dobin ${PN} || die
	newman ${PN}.man ${PN}.1 || die
	dodoc README || die
}
