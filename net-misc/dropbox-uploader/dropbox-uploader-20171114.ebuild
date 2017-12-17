# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3

DESCRIPTION="BASH script to up/download, list/delete files on Dropbox"
HOMEPAGE="https://github.com/andreafabrizi/Dropbox-Uploader"
EGIT_REPO_URI="https://github.com/andreafabrizi/Dropbox-Uploader.git"
EGIT_COMMIT="c719ac0e327de2b5fd60e898aeb5e3f62a65fb88"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-shells/bash
	net-misc/curl
"

src_install() {
	dobin dropbox_uploader.sh dropShell.sh
	dodoc README.md Dockerfile
}
