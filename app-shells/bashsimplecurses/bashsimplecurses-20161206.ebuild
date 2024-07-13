# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Functions to create windows on Xterm, aterm, urxvt... etc"
HOMEPAGE="https://github.com/metal3d/bashsimplecurses"
EGIT_REPO_URI="https://github.com/metal3d/${PN}.git"
EGIT_COMMIT="375c041b54df7454dfe5ebe299ce740c39d57f76"

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
