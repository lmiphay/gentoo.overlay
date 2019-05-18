# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit user eutils

MY_PN="${PN/-bin/}"

DESCRIPTION="Simple management UI for Docker"
HOMEPAGE="http://portainer.io"
SRC_URI="https://github.com/portainer/portainer/releases/download/${PV}/${MY_PN}-${PV}-linux-amd64.tar.gz"
RESTRICT="mirror"

LICENSE="ZLIB MIT"
SLOT="0"
KEYWORDS="~amd64 -*"
IUSE=""

INST_DIR="opt/${PN}"
QA_PREBUILT="${INST_DIR}/*"

RDEPEND="
	>=app-emulation/docker-18.09.5
"
DEPEND="${RDEPEND}
	app-admin/chrpath
"

S="${WORKDIR}/${MY_PN}"

pkg_setup() {
		enewgroup "${MY_PN}"
		enewuser "${MY_PN}" -1 -1 "/$INST_DIR" "${MY_PN}"
		usermod -aG "docker" "${MY_PN}"
}

src_prepare() {
	rm -f docker || die
	eapply_user
}

src_install() {
	mkdir -p "${D}/${INST_DIR}/"
	cp -a . "${D}/${INST_DIR}/" || die

	newconfd "${FILESDIR}/${MY_PN}.conf.d" "${MY_PN}"
	newinitd "${FILESDIR}/${MY_PN}.init.d" "${MY_PN}"

	keepdir "/var/lib/${MY_PN}/data"
	fowners -R "${MY_PN}:${MY_PN}" "/var/lib/${MY_PN}"

	insinto "/var/lib/${MY_PN}"
	doins templates.json
}
