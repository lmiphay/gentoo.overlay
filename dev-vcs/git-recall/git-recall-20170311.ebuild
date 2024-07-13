# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit git-r3

DESCRIPTION="git tool to easily recall what you've done"
HOMEPAGE="https://github.com/Fakerr/git-recall"
EGIT_REPO_URI="https://github.com/Fakerr/git-recall.git"
EGIT_COMMIT=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
"
RDEPEND="${DEPEND}
	dev-vcs/git
"

src_install() {
	dodoc README.md
	dobin ${PN}
}
