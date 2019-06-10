# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 autotools

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
	eautoreconf
	eapply_user
}

src_install() {
	dobin numatop
	doman numatop.8
	dodoc README.md
}
