# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Software-Defined Networking for Linux Containers"
HOMEPAGE="https://github.com/jpetazzo/pipework"
EGIT_REPO_URI="https://github.com/jpetazzo/pipework.git"
EGIT_COMMIT="ae42f1b5fef82b3bc23fe93c95c345e7af65fef3"

LICENSE="Apache-2/0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
"
RDEPEND="${DEPEND}
	app-shells/bash
"

src_install() {
	dobin pipework
	dodoc README.md
}
