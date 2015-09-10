# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION=""
HOMEPAGE="https://github.com/metal3d/bashsimplecurses"
EGIT_REPO_URI="https://github.com/metal3d/${PN}.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	media-libs/libcaca
	sys-libs/ncurses
"
DEPEND="${RDEPEND}
"

DOCS="README.md AUTHORS"

src_install() {
	insinto /usr/share/${PN}
	doins simple_curses.sh
	dodoc ${DOCS}
}

pkg_postinst() {
	elog "See docs at: http://bashsimplecurses.readthedocs.org/en/latest/"
}
