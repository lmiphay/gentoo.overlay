# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit git-r3

DESCRIPTION="a daily backup system similar to Plan9's dumpfs"
HOMEPAGE="https://github.com/lmiphay/pdumpfs"
EGIT_REPO_URI="https://github.com/lmiphay/pdumpfs.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="linguas_ja"

DEPEND="
	dev-lang/ruby
"

src_install() {
	dobin pdumpfs || die

	doman man/man8/pdumpfs.8
	dodoc -r doc/*

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
