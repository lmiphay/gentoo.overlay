# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/-bin/}"

DESCRIPTION="A modern load testing tool, using Go and JavaScript"
HOMEPAGE="https://k6.io"
SRC_URI="https://github.com/loadimpact/k6/releases/download/v${PV}/${MY_PN}-v${PV}-linux-amd64.tar.gz"
RESTRICT="mirror"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
IUSE=""

QA_PREBUILT="usr/bin/${MY_PN}"

RDEPEND="
"
DEPEND="${RDEPEND}
"

S="${WORKDIR}/${MY_PN}-v${PV}-linux-amd64"

src_install() {
	dobin k6
}
