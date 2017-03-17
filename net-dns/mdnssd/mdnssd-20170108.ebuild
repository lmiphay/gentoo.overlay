# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils toolchain-funcs git-r3

DESCRIPTION="A simple mDNS-SD browser"
HOMEPAGE="https://github.com/philippe44/mDNS-SD"
EGIT_REPO_URI="https://github.com/philippe44/mDNS-SD.git"
EGIT_COMMIT="3cebc2eee529bf7e9898f25989ba35046e869263"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
"
RDEPEND="${DEPEND}"

src_compile() {
	$(tc-getCC) ${CFLAGS} ${CPPFLAGS} ${LDFLAGS} -o ${PN} ${PN}-min.c ${PN}.c || die
}

src_install() {
	dobin ${PN}
	doheader ${PN}-itf.h ${PN}-min.h
	insinto /usr/share/${PN}
	doins ${PN}-min.c
}
