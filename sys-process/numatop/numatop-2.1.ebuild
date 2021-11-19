# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Tool for NUMA memory locality and processes/threads analysis"
HOMEPAGE="https://01.org/numatop"
SRC_URI="https://github.com/intel/${PN}/releases/download/v${PV}/${PN}-v${PV}.tar.xz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-libs/check
	sys-libs/ncurses
	sys-process/numactl
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-v${PV}"

src_prepare() {
	sed -i -e 's:numatop_LDADD = $(NCURSES_LIBS) libnumatop.la:numatop_LDADD = $(NCURSES_LIBS) libnumatop.la $(NCURSES_LIBS):' Makefile.am || die
	sed -i -e 's:mgen_LDADD = $(NCURSES_LIBS) libnumatop.la:mgen_LDADD = $(NCURSES_LIBS) libnumatop.la $(NCURSES_LIBS):' Makefile.am || die
	eautoreconf
	eautomake
	eapply_user
}

src_install() {
	dobin numatop
	doman numatop.8
	dodoc README.md
}
