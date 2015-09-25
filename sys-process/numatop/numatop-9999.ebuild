# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Tool for NUMA memory locality and processes/threads analysis"
HOMEPAGE="https://01.org/numatop"
EGIT_REPO_URI="https://github.com/01org/numatop.git"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	sys-libs/ncurses
	sys-process/numactl
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's;CFLAGS;MYCFLAGS;g' "Makefile"
	sed -i -e 's;LDFLAGS;MYLDFLAGS;g' "Makefile"
	sed -i -e 's;-g -Wall -O2;$(CFLAGS);' "Makefile"
	sed -i -e 's;-g;$(LDFLAGS);' "Makefile"
	epatch_user
}

src_install() {
	dobin numatop
	doman numatop.8
	dodoc README
}
