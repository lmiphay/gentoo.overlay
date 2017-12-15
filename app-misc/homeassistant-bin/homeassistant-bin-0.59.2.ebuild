# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit user readme.gentoo-r1 eutils

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
	>=dev-lang/python-3.5
"
RDEPEND="${DEPEND}
	app-admin/logrotate
	dev-python/virtualenv
"

INSTALL_DIR="/opt/${MY_PN}"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
 The HA interface listens on port 8123 - this _will_ take a minute or two to appear

 hass configuration is in: /etc/${MY_PN}
 command line arguments can be configured in: /etc/conf.d/${MY_PN}

 logging is to: /var/log/${MY_PN}/{server,errors,stdout}.log

 sqlite db by default is in: /etc/${MY_PN}
  - to move it after ${MY_PN} has run once: add/include /etc/${MY_PN}/recorder.yaml to /etc/${MY_PN}/configuration.yaml

 support thread at:
	https://community.home-assistant.io/t/gentoo-homeassistant-0-59-2-ebuild/35577
"

S="${WORKDIR}/home-assistant-${PV}"

pkg_setup() {
	enewgroup "${MY_PN}"
	enewuser "${MY_PN}" -1 -1 "$INSTALL_DIR" "${MY_PN}"
}

src_install() {
	keepdir "$INSTALL_DIR"

	keepdir "/etc/${MY_PN}"
	insinto "/etc/${MY_PN}"
	doins "${FILESDIR}/recorder.yaml"
	fowners -R "${MY_PN}:${MY_PN}" "/etc/${MY_PN}"

	python3 -m venv "${D}/$INSTALL_DIR"
	# for no output from pip add: --quiet
	VIRTUAL_ENV="$INSTALL_DIR" "${D}/$INSTALL_DIR/bin/python3" -m pip --no-cache-dir install "${MY_PN}"
	sed -i "1c#!$INSTALL_DIR/bin/python3" "${D}/$INSTALL_DIR/bin/hass"
	fowners -R "${MY_PN}:${MY_PN}" "$INSTALL_DIR"

	newconfd "${FILESDIR}/${MY_PN}.conf.d" "${MY_PN}"
	newinitd "${FILESDIR}/${MY_PN}.init.d" "${MY_PN}"

	insinto /etc/logrotate.d
	newins "${FILESDIR}/${MY_PN}.logrotate" "${MY_PN}"

	keepdir "/var/log/${MY_PN}"
	fowners -R "${MY_PN}:${MY_PN}" "/var/log/${MY_PN}"

	keepdir "/var/db/${MY_PN}"
	fowners -R "${MY_PN}:${MY_PN}" "/var/db/${MY_PN}"

	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
