# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Visual hexadecimal difference editor"
HOMEPAGE="http://tboudet.free.fr/hexdiff/"
SRC_URI="http://tboudet.free.fr/hexdiff/hexdiff.tar.gz -> hexdiff-${PV}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sys-libs/ncurses
"
RDEPEND="${DEPEND}
"

S="${WORKDIR}/HexDiff"

src_prepare () {
	sed -i -e 's:COMP=gcc:COMP=$(CC):' "Makefile" || die
	sed -i -e 's:COPT=-g:COPT=$(CFLAGS):' "Makefile" || die
	sed -i -e 's:LOPT=:LOPT=$(LDFLAGS) :' "Makefile" || die
	default
}

src_install() {
	dobin hexdiff
	doman hexdiff.1
}
