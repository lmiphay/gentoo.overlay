# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils user

DESCRIPTION="Fast source code search and cross reference engine"
HOMEPAGE="http://opengrok.github.io/OpenGrok/"
SRC_URI="http://java.net/projects/opengrok/downloads/download/opengrok-${PV}.tar.gz"
RESTRICT="mirror"

LICENSE="CDDL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

# || (tomcat glassfish)
RDEPEND=">=virtual/jre-1.7
   >=dev-util/ctags-5.8
   >=www-servers/tomcat-7.0.56
"
DEPEND="${RDEPEND}"

INSTALL_DIR="/opt/${PN}"
SRC_DIR="/var/${PN}/src"
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
	elog "To deploy the web app (OPENGROK_TOMCAT_BASE may be: /var/lib/tomcat-7-main):"
	elog "  export OPENGROK_TOMCAT_BASE=/path/to/my/tomcat/install"
	elog "  ${INSTALL_DIR}/bin/OpenGrok deploy"
	elog ""
	elog "To index source(s) (default is under: ${SRC_DIR}):"
	elog "  ${INSTALL_DIR}/bin/OpenGrok index <absolute_path_to_your_SRC_ROOT>"
	elog ""
	elog "Browse to: http://YOUR_WEBAPP_SERVER:WEBAPPSRV_PORT/source"
	elog ""
	elog "See: https://github.com/OpenGrok/OpenGrok/wiki/How-to-install-OpenGrok"
}
