# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Execute a command over ssh on multiple hosts with one command"
HOMEPAGE="http://mussh.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="
	net-misc/openssh
"
DEPEND="${RDEPEND}
"

DOCS="BUGS CHANGES EXAMPLES README"

S="${WORKDIR}/${PN}"

src_install() {
	dobin ${PN}
	doman ${PN}.1
	dodoc ${DOCS}
}
