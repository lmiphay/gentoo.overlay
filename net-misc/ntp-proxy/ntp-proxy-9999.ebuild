# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3

DESCRIPTION="Leap second immunity verification programs"
HOMEPAGE="http://www.amadeus.com/web/amadeus/en_1A-corporate/Amadeus-Home/Travel-trends/Travel-technology-trends/Open-source/Our-contributions/NTP-Proxy/1319686226159-Page-AMAD_DetailPpal"
EGIT_REPO_URI="https://github.com/AmadeusITGroup/NTP-Proxy.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	net-libs/libnet:1.1
"
DEPEND="${RDEPEND}"

DOCS="README.md"

src_install() {
	dodoc ${DOCS}
	dosbin sls ntpproxy
	newconfd "${FILESDIR}"/${PN}.conf.d ${PN}
	newinitd "${FILESDIR}"/${PN}.init.d ${PN}
}
