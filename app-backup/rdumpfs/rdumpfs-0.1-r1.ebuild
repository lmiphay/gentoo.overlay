# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="a rsync-based dump file system backup tool"
HOMEPAGE="https://github.com/chneukirchen/rdumpfs"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-racl +xattr"

DEPEND=""
RDEPEND="net-misc/rsync[xattr?]"

src_prepare() {
	use xattr || sed -i '/RDUMPFS_DEFAULT_ARGS:=/s/aHAX/aHA/' "${PN}" || die
	use racl   || sed -i '/RDUMPFS_DEFAULT_ARGS:=/s/aHA/aH/' "${PN}" || die
	eapply_user
}

src_install() {
	dobin "${PN}" yday
	dodoc README sample.home.rdumpfs sample.root.rdumpfs
}

pkg_postinst() {
	elog "Review the options passed to rsync by ${PN}"
	elog "see: RDUMPFS_DEFAULT_ARGS in /usr/bin/${PN}"
}
