# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

XORG_STATIC=no
inherit xorg-3

DESCRIPTION="tvtwm X11 window manager"
HOMEPAGE="http://ftp.x.org/contrib/window_managers"
SRC_URI="https://ftp.gwdg.de/pub/x11/x.org/contrib/window_managers/tvtwm.pl11.tar.gz"
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
	x11-misc/xbitmaps
	"
DEPEND="${RDEPEND}
	sys-devel/bison
	sys-devel/flex
	x11-misc/imake
"

DOCS=( "README" "README.old" "sample-twmrc/cross.twmrc" )

S="${WORKDIR}/${PN}"

src_configure() {
	xmkmf || die

	sed -i -e 's:-D_POSIX_SOURCE -D_XOPEN_SOURCE:-D_DEFAULT_SOURCE:g' "Makefile"
	sed -i '/ CC = gcc/d' "Makefile"

	sed -i -e 's:YYBISON:notdef:' "gram.y"

	sed -i '58istatic char *m4_defs(Display *display, char* host);' "parse.c"
	sed -i -e 's:static char \*m4_defs();::' "parse.c"

	sed -i '43i#include <stdlib.h>' "ssetroot.c"
	sed -i '43i#include <string.h>' "ssetroot.c"

	sed -i '206d' "regexp.c"
	sed -i -e 's:extern char \*strchr();:#include <string.h>:' "regexp.c"
	sed -i '34i#include <stdlib.h>' "regexp.c"

	sed -i '146i#include <unistd.h>' "vdt.c"
}

src_compile() {
	emake -j 1 CC="$(tc-getCC)" CCOPTIONS="${CFLAGS}" EXTRA_LDOPTIONS="${LDFLAGS}"
}

src_install() {
	dobin ${PN} ssetroot

	newman ${PN}.man ${PN}.1

	insinto /usr/lib/X11/tvtwm
	newins system.twmrc system.tvtwmrc

	einstalldocs
}
