# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=(python3_5)

inherit user readme.gentoo-r1 eutils distutils-r1

MY_PN="${PN/-bin/}"

DESCRIPTION="Home automation platform (Python 3 required)"
HOMEPAGE="https://home-assistant.io"
SRC_URI="https://github.com/home-assistant/home-assistant/archive/${PV}.tar.gz -> ${MY_PN}-${PV}.tar.gz"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="atv hs100 maint tradfri wemo"

DEPEND="
	${PYTHON_DEPS}
	!app-misc/homeassistant
	dev-python/virtualenv[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-2.3.6[${PYTHON_USEDEP}]
	>=dev-python/astral-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/async_timeout-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2017.11.5[${PYTHON_USEDEP}]
	>=dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	>=dev-python/gtts-token-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.9.6[${PYTHON_USEDEP}]
	>=dev-python/pip-9.0.1[${PYTHON_USEDEP}]
	>=dev-python/pytz-2017.2[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.12[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18.4[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.1.15[${PYTHON_USEDEP}]
	>=dev-python/typing-3.6.2[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.10.5[${PYTHON_USEDEP}]
	>=dev-python/xmltodict-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-0.16.0[${PYTHON_USEDEP}]
	>=media-libs/mutagen-1.39[${PYTHON_USEDEP}]
	atv? ( >=dev-python/pyatv-0.3.9[${PYTHON_USEDEP}] )
	hs100? ( >=dev-python/pyhs100-0.3.0[${PYTHON_USEDEP}] )
	tradfri? ( >=dev-python/pytradfri-4.1.0[${PYTHON_USEDEP}] )
	wemo? ( >=dev-python/pywemo-0.4.20[${PYTHON_USEDEP}] )
"
# add:
# home-assistant-frontend==20171216.0
# user-agents==1.1.0
# aiohttp_cors==0.5.3
# distro==1.1.0
# netdisco==1.2.3
# fuzzywuzzy==0.15.1

RDEPEND="${DEPEND}
	app-admin/logrotate
	maint? (
		app-crypt/certbot
		app-crypt/ssl-cert-check
		net-misc/dropbox-uploader
	)
"

INSTALL_DIR="/opt/${MY_PN}"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
 The HA interface listens on port 8123 - this _will_ take a minute or two to appear

 hass configuration is in: /etc/${MY_PN}
 daemon command line arguments are configured in: /etc/conf.d/${MY_PN}

 logging is to: /var/log/${MY_PN}/{server,errors,stdout}.log

 The sqlite db is by default in: /etc/${MY_PN}
 To move it after ${MY_PN} has run once and while ${MY_PN} is stopped:
   - add /etc/${MY_PN}/recorder.yaml to /etc/${MY_PN}/configuration.yaml
   - mv /etc/${MY_PN}/home-assistant_v2.db /var/db/${MY_PN}

 support thread at:
	https://community.home-assistant.io/t/gentoo-homeassistant-0-59-2-ebuild/35577
"

S="${WORKDIR}/home-assistant-${PV}"

pkg_setup() {
	enewgroup "${MY_PN}"
	enewuser "${MY_PN}" -1 -1 "$INSTALL_DIR" "${MY_PN}"
}

src_prepare() {
	sed -e 's;astral==1.4;astral>=1.4;' \
		-i "setup.py" \
		-i homeassistant/package_constraints.txt

	eapply_user
}

src_install() {
	keepdir "$INSTALL_DIR"

	keepdir "/etc/${MY_PN}"
	insinto "/etc/${MY_PN}"
	doins "${FILESDIR}/recorder.yaml"
	fowners -R "${MY_PN}:${MY_PN}" "/etc/${MY_PN}"

	python3 -m venv --system-site-packages "${D}/$INSTALL_DIR"
	VIRTUAL_ENV="$INSTALL_DIR" "${D}/$INSTALL_DIR/bin/python3" setup.py install

	sed -i "1c#!$INSTALL_DIR/bin/python3" "${D}/$INSTALL_DIR/bin/hass"
	fowners -R "${MY_PN}:${MY_PN}" "$INSTALL_DIR"

	newconfd "${FILESDIR}/${MY_PN}.conf.d" "${MY_PN}"
	newinitd "${FILESDIR}/${MY_PN}.init.d" "${MY_PN}"

	insinto /etc/logrotate.d
	newins "${FILESDIR}/${MY_PN}.logrotate" "${MY_PN}"

	keepdir "/var/log/${MY_PN}/old"
	fowners -R "${MY_PN}:${MY_PN}" "/var/log/${MY_PN}"

	keepdir "/var/db/${MY_PN}"
	fowners -R "${MY_PN}:${MY_PN}" "/var/db/${MY_PN}"

	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}

pkg_config() {
	"${INSTALL_DIR}/bin/hass" --script ensure_config
}
