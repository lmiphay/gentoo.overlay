# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

XORG_STATIC=no
inherit xorg-3

DESCRIPTION="tvtwm X11 window manager"
HOMEPAGE="http://ftp.x.org/contrib/window_managers"
SRC_URI="http://ftp.x.org/contrib/window_managers/tvtwm.pl11.tar.gz"
RESTRICT="mirror"
LICENSE="tvtwm"

KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-devel/m4
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXmu
	x11-libs/libXpm
	x11-libs/libXt
	"
DEPEND="${RDEPEND}
	sys-devel/bison
	sys-devel/flex
"

S="${WORKDIR}/${PN}"

src_configure() {
	xmkmf || die
	sed -i -e 's:YYBISON:notdef:' "gram.y"
	sed -i '58istatic char *m4_defs(Display *display, char* host);' parse.c
	sed -i -e 's:static char \*m4_defs();::' parse.c
}

src_compile() {
	emake -j 1 CC="$(tc-getCC)" CCOPTIONS="${CFLAGS}" EXTRA_LDOPTIONS="${LDFLAGS}" || die
}

src_install() {
	dobin ${PN} ssetroot || die
	newman ${PN}.man ${PN}.1 || die
	dodoc -r README README.old sample-twmrc || die
	insinto /usr/lib/X11/tvtwm
	newins system.twmrc system.tvtwmrc
}
