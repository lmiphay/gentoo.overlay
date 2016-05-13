# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils user

DESCRIPTION="Fast source code search and cross reference engine"
HOMEPAGE="http://opengrok.github.io/OpenGrok/"
SRC_URI="https://java.net/projects/opengrok/downloads/download/opengrok-${PV}.tar.gz"
#SRC_URI="https://github.com/OpenGrok/OpenGrok/files/213268/opengrok-${PV}.tar.gz"

RESTRICT="mirror"

LICENSE="CDDL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

# || (tomcat glassfish)
RDEPEND="
	>=dev-util/ctags-5.8
	>=www-servers/tomcat-8.0.32-r1
"
DEPEND="${RDEPEND}"

INSTALL_DIR="/opt/opengrok"
SRC_DIR="/var/opengrok/src"
USER_ID="opengrok"
GROUP_ID="opengrok"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}"/opengrok-${PV} "${WORKDIR}"/${PN}-${PV}
}

src_install() {
	dodir "${INSTALL_DIR}"
	cp -pRP bin doc lib man "${ED}/${INSTALL_DIR}" || die

	dodir "${SRC_DIR}"
	fowners "${USER_ID}:${GROUP_ID}" "${SRC_DIR}" -R
	fperms 770 "${SRC_DIR}"
}

pkg_setup() {
	if ! built_with_use dev-vcs/subversion java; then
		eerror "Opengrok needs java support in subversion to work,"
		eerror "please rebuild subversion with java in its USE."
	fi

	enewgroup "${GROUP_ID}"
	enewuser "${USER_ID}" -1 -1 -1 "${GROUP_ID}"
}

pkg_postinst() {
	elog "To create a tomcat instance to host opengrok, see: https://wiki.gentoo.org/wiki/Apache_Tomcat"
	elog "e.g. /usr/share/tomcat-8/gentoo/tomcat-instance-manager.bash --create"
	elog ""
	elog "To deploy the web app see: https://github.com/OpenGrok/OpenGrok/wiki/How-to-install-OpenGrok"
	elog "e.g. OPENGROK_TOMCAT_BASE=/var/lib/tomcat-8 ${INSTALL_DIR}/bin/OpenGrok deploy"
	elog ""
	elog "To index the source directory (${SRC_DIR}):"
	elog "  ${INSTALL_DIR}/bin/OpenGrok index <absolute_path_to_your_SRC_ROOT>"
	elog ""
	elog "Browse to: http://YOUR_WEBAPP_SERVER:WEBAPPSRV_PORT/source"
	elog "e.g. http://localhost:8080/source/"
}
