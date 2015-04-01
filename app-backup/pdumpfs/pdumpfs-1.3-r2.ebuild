# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

DESCRIPTION="a daily backup system similar to Plan9's dumpfs"
HOMEPAGE="http://0xcc.net/pdumpfs/"
SRC_URI="http://0xcc.net/pdumpfs/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="linguas_ja"

DEPEND="
	>=dev-lang/ruby-2.0.0_p598
"

src_prepare() {
	epatch "${FILESDIR}/${PN}.in.patch"
	epatch "${FILESDIR}/${PN}-test.patch"
}

src_install() {
	dobin pdumpfs || die

	doman man/man8/pdumpfs.8
	dohtml -r doc/*

	if use linguas_ja; then
		insinto /usr/share/man/ja/man8
		doins man/ja/man8/pdumpfs.8
	fi

	dodoc ChangeLog README
}
