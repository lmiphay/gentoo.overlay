# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils multilib bzr

DESCRIPTION="A C++ client library for the MariaDB and MySQL databases"
HOMEPAGE="https://launchpad.net/mariadb++"
EBZR_REPO_URI="lp:mariadb++"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	|| ( dev-db/mariadb dev-db/mariadb-connector-c )
	dev-libs/openssl
	sys-libs/zlib
"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/makefile.patch"
}

src_install() {
	dolib.a lib/libmariadb++.a
	newlib.so lib/libmariadb++.so libmariadb++.so.1
	dosym libmariadb++.so.1 /usr/$(get_libdir)/libmariadb++.so
	insinto /usr/include
	doins -r include/mariadb++
}
