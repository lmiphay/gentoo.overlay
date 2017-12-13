# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python3_5 )

inherit user readme.gentoo-r1 eutils distutils-r1

DESCRIPTION="Open-source home automation platform running on Python 3"
HOMEPAGE="https://home-assistant.io"
SRC_URI="https://github.com/home-assistant/home-assistant/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/requests-2.18.4[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.12[${PYTHON_USEDEP}]
	>=dev-python/pytz-2017.02[${PYTHON_USEDEP}]
	>=dev-python/pip-9.0.1[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.9.6[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.10.5[${PYTHON_USEDEP}]
	>=dev-python/typing-3.5.3.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-2.3.2[${PYTHON_USEDEP}]
	>=dev-python/yarl-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/async_timeout-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	>=dev-python/certifi-2017.4.17[${PYTHON_USEDEP}]
"
# astral==1.4

DEPEND="
	!app-misc/homeassistant-bin
	>=dev-lang/python-3.5
	${RDEPEND}
"

INSTALL_DIR="/opt/${PN}"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
 The HA interface listens on port 8123 - this _will_ take a minute or two to appear

 hass configuration is in: /etc/${PN}
 command line arguments can be configured in: /etc/conf.d/${PN}
 logging is to /var/log/${MY_PN}-errors.log and /var/log/${MY_PN}.log
"

S="${WORKDIR}/home-assistant-${PV}"

DOCS="README.rst"

pkg_setup() {
	enewgroup "${PN}"
	enewuser "${PN}" -1 -1 "$INSTALL_DIR" "${PN}"
}

python_install_all() {
	dodoc ${DOCS}
	distutils-r1_python_install_all

	keepdir "$INSTALL_DIR"

	keepdir "/etc/${PN}"
	fowners -R "${PN}:${PN}" "/etc/${PN}"

	newconfd "${FILESDIR}/${PN}.conf.d" "${PN}"
	newinitd "${FILESDIR}/${PN}.init.d" "${PN}"

	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
