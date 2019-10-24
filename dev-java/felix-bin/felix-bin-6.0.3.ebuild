# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit eutils

DESCRIPTION="OSGi Framework and Service platform"
HOMEPAGE="http://felix.apache.org/"
LICENSE="Apache-2.0"

SRC_URI="mirror://apache/felix/org.apache.felix.main.distribution-${PV}.tar.gz"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8
"

RDEPEND="$DEPEND"

S="${WORKDIR}/felix-framework-${PV}"

src_install() {
	dobin "${FILESDIR}/felix"
	dodoc -r doc/*

	dodir /opt/felix-bin
	cp -pRP bin bundle conf "${ED}/opt/felix-bin" || die
}

pkg_postinst() {
	elog "Quickstart: "
	elog "   $ cp -pr /opt/felix-bin/{bundle,conf} <scratch_dir>"
	elog "   $ felix"
}
