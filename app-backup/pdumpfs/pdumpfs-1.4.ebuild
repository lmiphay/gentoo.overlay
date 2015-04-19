# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

DESCRIPTION="a daily backup system similar to Plan9's dumpfs"
HOMEPAGE="https://github.com/lmiphay/pdumpfs"
SRC_URI="https://github.com/lmiphay/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="linguas_ja"

DEPEND="
	>=dev-lang/ruby-2.0.0_p598
"

src_install() {
	dobin pdumpfs || die

	doman man/man8/pdumpfs.8
	dohtml -r doc/*

	if use linguas_ja; then
		insinto /usr/share/man/ja/man8
		doins man/ja/man8/pdumpfs.8
	fi

	dodoc README.md ChangeLog README.original
}

pkg_postinst() {
	elog "${PN} works best when backing up to directly connected storage devices."
	elog "Consider app-backup/rdumpfs if you need to create dumpfs style backups to network locations."
	elog "The original ${PN} homepage is located at: http://0xcc.net/pdumpfs/"
}
