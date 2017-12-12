# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit readme.gentoo-r1 eutils

MY_PN="${PN/-bin/}"

DESCRIPTION="Open-source home automation platform running on Python 3"
HOMEPAGE="https://home-assistant.io"
SRC_URI="https://github.com/home-assistant/home-assistant/archive/${PV}.tar.gz -> ${MY_PN}-${PV}.tar.gz"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	!app-misc/homeassistant
	dev-python/pip
	>=dev-lang/python-3.4
"
RDEPEND="${DEPEND}
	dev-python/virtualenv
"

INSTALL_DIR="/opt/${MY_PN}"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
 hass configuration is in: /etc/${MY_PN}
 command line arguments can be configured in: /etc/conf.d/${MY_PN}
 logging is to /var/log/${MY_PN}.log
"

pkg_setup() {
	enewgroup "${MY_PN}"
	enewuser "${MY_PN}" -1 -1 "$INSTALL_DIR" "${MY_PN}"
}

src_install() {
	keepdir "$INSTALL_DIR"

	keepdir "/etc/${MY_PN}"
	fowners -R "${MY_PN}:${MY_PN}" "/etc/${MY_PN}"

	python3 -m venv "$INSTALL_DIR"
	VIRTUAL_ENV="$INSTALL_DIR" "$INSTALL_DIR/bin/python3" -m pip install "${MY_PN}"
	fowners -R "${MY_PN}:${MY_PN}" "$INSTALL_DIR"

	newconfd "${FILESDIR}/${MY_PN}.conf.d" "${MY_PN}"
	newinitd "${FILESDIR}/${MY_PN}.init.d" "${MY_PN}"

	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
