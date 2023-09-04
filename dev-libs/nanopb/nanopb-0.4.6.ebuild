# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="plain-C Protocol Buffers for embedded/memory-constrained systems"
HOMEPAGE="http://koti.kapsi.fi/jpa/nanopb/"
SRC_URI="http://koti.kapsi.fi/~jpa/nanopb/download/${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples"

RDEPEND="
	dev-libs/protobuf
"
DEPEND="
	dev-util/scons
	${RDEPEND}
"

S="${WORKDIR}/${PN}"

src_install() {
	insinto /usr/include/${PN}
	doins pb.h pb_common.h pb_decode.h pb_encode.h

	insinto /usr/share/${PN}
	doins pb_common.c pb_decode.c pb_encode.c

	if use doc ; then
		dodoc -r README.txt CHANGELOG.txt docs
	fi

	if use examples ; then
		dodoc -r examples
	fi
}

src_test() {
	cd "${S}"/tests
	scons
}
