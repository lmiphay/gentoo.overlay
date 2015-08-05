# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils git-r3

DESCRIPTION="Squeezebox ShairPort2 Helper"
HOMEPAGE="https://github.com/disaster123/shairport2_plugin"
EGIT_REPO_URI="https://github.com/disaster123/shairport2_plugin.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/openssl
	media-libs/libao"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/shairport_helper/src"

src_prepare() {
	sed -i -e 's;CFLAGS;MYCFLAGS;g' "Makefile.default"
	sed -i -e 's;-Wall -O2 -fPIC;$(CFLAGS);' "Makefile.default"
	sed -i -e 's;LDFLAGS;MYLDFLAGS;' "Makefile.default"
	sed -i -e 's;-static;$(LDFLAGS);' "Makefile.default"
	epatch_user
}

src_install() {
	newbin shairport_helper shairport2_helper
	dodoc README.md
}

pkg_postinst() {
	elog "shairport2_helper installed"
}
