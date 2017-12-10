# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit readme.gentoo-r1 eutils versionator

DESCRIPTION="Open-source home automation platform running on Python 3"
HOMEPAGE="https://home-assistant.io"
SRC_URI="https://github.com/home-assistant/home-assistant/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/pip
	>=dev-lang/python-3.4
"
RDEPEND="${DEPEND}
	dev-python/virtualenv
"

INSTALL_DIR="/opt/homeassistant-bin"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
	--config /etc/homeassistant
	--pid-file path_to_pid_file
	--log-file /var/log/homeassistant/homeassistant.log
"

pkg_setup() {
	enewgroup homeassistant
	enewuser homeassistant -1 -1 $INSTALL_DIR "homeassistant"
}

src_install() {
	keepdir $INSTALL_DIR

	#python3 -m venv $INSTALL_DIR
	#source $INSTALL_DIR/bin/activate && \
		#	python3 -m pip install homeassistant

	newconfd "${FILESDIR}/homeassistant.conf.d" "homeassistant"
	newinitd "${FILESDIR}/homeassistant.init.d" "homeassistant"

	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
