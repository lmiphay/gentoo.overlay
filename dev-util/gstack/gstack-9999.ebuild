# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Display stack trace of a running process."
HOMEPAGE="https://admin.fedoraproject.org/pkgdb/package/gdb/"

# the patch file has been updated a number of times since 20050411 without
# changing the file name.
patchfile="gdb-6.3-${PN}-20050411.patch"
manpage="gdb-${PN}.man"

SRC_URI="
	http://pkgs.fedoraproject.org/cgit/gdb.git/plain/${patchfile} -> ${patchfile}_${PV}
	http://pkgs.fedoraproject.org/cgit/gdb.git/plain/${manpage} -> ${manpage}_${PV}
"
RESTRICT="mirror"

SLOT="0"
LICENSE="GPL-2 GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-util/patchutils
"
RDEPEND="
	sys-devel/gdb
"

src_unpack() {
	mkdir -p ${S}
}

src_prepare() {
	filterdiff -i '*/gstack.sh' ${DISTDIR}/${patchfile}_${PV} | patch -p2
	epatch_user
}

src_install() {
	newbin gstack.sh gstack
	newman ${DISTDIR}/${manpage}_${PV} gstack.1
}
