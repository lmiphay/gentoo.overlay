# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit git-r3

DESCRIPTION="A utility to back up remote files with pdumpfs and rsync"
HOMEPAGE="https://github.com/lmiphay/pdumpfs-rsync"
EGIT_REPO_URI="https://github.com/lmiphay/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-lang/ruby-2.0.0_p598
"

src_install() {
	dobin $PN
}
