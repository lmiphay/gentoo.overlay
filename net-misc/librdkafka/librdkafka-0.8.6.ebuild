# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Apache Kafka C/C++ library"
HOMEPAGE="https://github.com/edenhill/librdkafka"
SRC_URI="https://github.com/edenhill/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
"
DEPEND="
	${RDEPEND}
"
DOCS="INTRODUCTION.md CONFIGURATION.md"

src_compile() {
	./configure --prefix=/usr
	emake
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc ${DOCS}
}
