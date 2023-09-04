# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit readme.gentoo-r1 java-pkg-2

MY_PN="${PN/-bin/}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Philips Hue emulator (for Vera, Harmony, Nest...etc) for Alexa"
HOMEPAGE="https://github.com/bwssytems/ha-bridge"
SRC_URI="https://github.com/bwssytems/ha-bridge/releases/download/v${PV}/${MY_P}.jar"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=virtual/jdk-1.8
"
DEPEND="
	${RDEPEND}
	dev-libs/openssl
	!net-misc/ha-bridge
"

ETC_DIR="/etc/ha-bridge"
USER_ID="ha-bridge"
GROUP_ID="ha-bridge"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
TBD
"

S="${WORKDIR}"

pkg_setup() {
	enewgroup "${GROUP_ID}"
	enewuser "${USER_ID}" -1 -1 -1 "${GROUP_ID}"
}

src_unpack() {
	true
}

src_compile() {
	cp -p "${DISTDIR}/${MY_P}.jar" "${MY_PN}.jar" || die
}

src_install() {
	java-pkg_dojar "${MY_PN}.jar"

	java-pkg_dolauncher \
		"${MY_PN}" \
		--java_args '-Dserver.port=${HA_BRIDGE_PORT:-8060}\
					 -Dsecurity.key=${HA_BRIDGE_SECURITY_KEY}\
					 -Dconfig.file=/etc/ha-bridge/ha-bridge.config' \
		--jar "${MY_PN}.jar" \
		--pwd /var/lib/ha-bridge \
		-pre "${FILESDIR}/${MY_PN}.source_config"

	newconfd "${FILESDIR}/${MY_PN}.conf.d" "${MY_PN}"
	newinitd "${FILESDIR}/${MY_PN}.init.d" "${MY_PN}"

	SECURITY_KEY=$(openssl rand -hex 12)
	sed -i -e "s;@@SECURITY_KEY@@;${SECURITY_KEY};" "${D}/etc/conf.d/${MY_PN}"

	insinto /etc/logrotate.d
	newins "${FILESDIR}/${MY_PN}.logrotate" "${MY_PN}"

	keepdir "/var/lib/${MY_PN}/data"
	fowners "${USER_ID}:${GROUP_ID}" "/var/lib/${MY_PN}" -R

	keepdir "/var/log/${MY_PN}/old"
	fowners -R "${MY_PN}:${MY_PN}" "/var/log/${MY_PN}"

	keepdir "/etc/${MY_PN}"
	fowners "${USER_ID}:${GROUP_ID}" "${ETC_DIR}" -R
	fperms 775 "${ETC_DIR}"

	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
