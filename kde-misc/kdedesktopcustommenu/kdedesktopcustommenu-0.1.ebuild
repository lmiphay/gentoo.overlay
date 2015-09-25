# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit kde4-base

DESCRIPTION="Custom context menu for the KDE desktop"
HOMEPAGE="http://sourceforge.net/projects/kdedesktopcustommenu/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	$(add_kdebase_dep plasma-workspace)
"
DEPEND="${RDEPEND}
"

src_install() {
	dodoc HOWTO README
	kde4-base_src_install
}

pkg_postinst() {
	elog "To enable this launcher see the documentation in: /usr/share/doc/${P}"
}
