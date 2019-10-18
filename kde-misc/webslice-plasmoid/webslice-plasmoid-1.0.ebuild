# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Plasma 5 widget to display a webpage or image"
LICENSE="AGPL-3"
KEYWORDS=""
IUSE=""

HOMEPAGE="http://www.cqoicebordel.net/webslice-plasmoid/"
SRC_URI="https://github.com/Cqoicebordel/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
RESTRICT="mirror"

RDEPEND="
	$(add_plasma_dep plasma-workspace)
"
DEPEND="${RDEPEND}
"

src_prepare() {
	cp -p ${FILESDIR}/CMakeLists.txt ${S}
	kde5_src_prepare
}
