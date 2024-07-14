# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit git-r3

DESCRIPTION="Send notifications when SSL certificates are about to expire"
HOMEPAGE="https://github.com/Matty9191/ssl-cert-check"
EGIT_REPO_URI="https://github.com/Matty9191/ssl-cert-check.git"
EGIT_COMMIT="4056ceeab5abc0e39f4e0ea40cd54147253a3369"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-shells/bash
	dev-libs/openssl
"

src_install() {
	dobin ssl-cert-check
	dodoc README.md
}
