# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Generic command line non-JVM Apache Kafka producer and consume"
HOMEPAGE="https://github.com/edenhill/kafkacat"
SRC_URI="https://github.com/edenhill/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
"
DEPEND="
	dev-libs/yajl
	net-misc/librdkafka
	${RDEPEND}
"

src_compile() {
	./configure --prefix=/usr
	emake
}

src_install() {
	dobin kafkacat
	doman kafkacat.1
	dodoc README.md
}
