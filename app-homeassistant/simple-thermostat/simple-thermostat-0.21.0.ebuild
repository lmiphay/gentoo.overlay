# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit readme.gentoo-r1

DESCRIPTION="A different take on the thermostat card for Home Assistant Lovelace UI"
HOMEPAGE="https://github.com/nervetattoo/simple-thermostat"
SRC_URI="https://github.com/nervetattoo/simple-thermostat/releases/download/${PV}/${PN}.js -> ${P}.js"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="app-misc/homeassistant-bin"
DEPEND=""
BDEPEND=""

S="${WORKDIR}"

DISABLE_AUTOFORMATTING=1
FORCE_PRINT_ELOG=1
DOC_CONTENTS="
	To configure Lovelace to load the simple-thermostat card, see:

	https://github.com/nervetattoo/simple-thermostat#installation-manual
"

src_unpack() {
	true
}

src_install() {
	insinto /etc/homeassistant/www
	newins "${DISTDIR}/${P}.js" "${PN}.js"

	readme.gentoo_create_doc
	default
}

pkg_postinst() {
	readme.gentoo_print_elog
}
