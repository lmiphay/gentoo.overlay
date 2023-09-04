# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# fixme: add back in bzr support for the code checkout
#inherit eutils multilib bzr
inherit multilib

DESCRIPTION="A C++ client library for the MariaDB and MySQL databases"
HOMEPAGE="https://launchpad.net/mariadb++"
EBZR_REPO_URI="lp:mariadb++"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS=""
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
