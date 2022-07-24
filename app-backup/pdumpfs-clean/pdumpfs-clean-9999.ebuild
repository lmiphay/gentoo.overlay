# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit eutils git-r3

DESCRIPTION="A utility to clean up old backup files of a pdumpfs archive"
HOMEPAGE="https://github.com/lmiphay/pdumpfs-clean"
EGIT_REPO_URI="https://github.com/lmiphay/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-lang/ruby
"

src_install() {
	dobin ${PN}
}
