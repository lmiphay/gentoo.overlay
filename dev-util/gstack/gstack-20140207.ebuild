# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Display stack trace of a running process."
HOMEPAGE="https://admin.fedoraproject.org/pkgdb/package/gdb/"

# the patch file has been updated a number of times since 20050411 without
# changing the file name.
patchfile="gdb-6.3-${PN}-20050411.patch"
patchhash="2c55a5441d00bc3f00df01ed3184da81461c6cb2"
manpage="gdb-${PN}.man"
manhash="08593f1932ecb3f18c9531a6e35317dcea7a67e4"

# moved to https://src.fedoraproject.org/rpms/gdb/blob/rawhide/f/gdb-6.3-gstack-20050411.patch
#          https://src.fedoraproject.org/rpms/gdb/raw/rawhide/f/gdb-6.3-gstack-20050411.patch
SRC_URI="
	https://src.fedoraproject.org/rpms/gdb/raw/rawhide/f/${patchfile}?id=${patchhash} -> ${patchfile}_${PV}
	https://src.fedoraproject.org/rpms/gdb/raw/rawhide/f/${manpage}?id=${manhash} -> ${manpage}_${PV}
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
	dev-debug/gdb
"

src_unpack() {
	mkdir -p ${S}
}

src_prepare() {
	filterdiff -i '*/gstack.sh' ${DISTDIR}/${patchfile}_${PV} | patch -p2
	eapply_user
}

src_install() {
	newbin gstack.sh gstack
	newman ${DISTDIR}/${manpage}_${PV} gstack.1
}
