# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils git-r3

DESCRIPTION="Squeezebox ShairPort Helper"
HOMEPAGE="https://github.com/StuartUSA/shairport_plugin/"
EGIT_REPO_URI="git://github.com/StuartUSA/shairport_plugin.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-libs/openssl
	media-libs/libao"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/${PN}/src"

src_prepare() {
	sed -i -e 's:prefix=/usr/local:prefix=/usr:' "Makefile"
	sed -i -e 's;CFLAGS:=-O2 -Wall $(MY_CFLAGS);CFLAGS:=$(MY_CFLAGS) $(CFLAGS);' "Makefile"
	sed -i -e 's;LDFLAGS:=-lm -lpthread $(MY_LDFLAGS);LDFLAGS:=-lm -lpthread $(MY_LDFLAGS) $(LDFLAGS);' "Makefile"
	emake clean
	epatch_user
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README.md
}

pkg_postinst() {
	elog "shairport_helper installed"
}
