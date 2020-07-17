# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN/-bin/}"

DESCRIPTION="App dev/test directly in Kubernetes"
HOMEPAGE="https://okteto.com/"
SRC_URI="https://github.com/okteto/okteto/releases/download/${PV}/okteto-Linux-x86_64 -> ${P}"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

BDEPEND="
"
DEPEND="
"
RDEPEND="
	${DEPEND}
"

S="${WORKDIR}"

src_install() {
	newbin "${DISTDIR}/${P}" "${MY_PN}"
}
