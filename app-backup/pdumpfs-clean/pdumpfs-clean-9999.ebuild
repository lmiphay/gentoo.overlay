# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils git-r3

DESCRIPTION="A utility to clean up old backup files of a pdumpfs archive"
HOMEPAGE="https://github.com/lmiphay/pdumpfs-clean"
EGIT_REPO_URI="https://github.com/lmiphay/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-lang/ruby-2.0.0_p598
"

src_install() {
	dobin ${PN}
}
