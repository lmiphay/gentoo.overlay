# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils user

REVISION=757802
MY_PV="0.13-rc9"

DESCRIPTION="Fast source code search and cross reference engine"
HOMEPAGE="http://opengrok.github.io/OpenGrok/"
SRC_URI="https://github.com/OpenGrok/OpenGrok/files/${REVISION}/${PN}-${MY_PV}.tar.gz.zip"

RESTRICT="mirror"

LICENSE="CDDL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+doc subversion"

# || (tomcat glassfish)
RDEPEND="
	>=dev-util/ctags-5.8
	>=www-servers/tomcat-8.0.39
	subversion? ( >=dev-vcs/subversion-1.9.5[java] )
"
DEPEND="
	${RDEPEND}
	app-text/docbook-xsl-stylesheets
	dev-libs/libxslt
"

INSTALL_DIR="/opt/opengrok-bin"
SRC_DIR="/var/opengrok/src"
USER_ID="opengrok"
GROUP_ID="opengrok"

pkg_setup() {
	enewgroup "${GROUP_ID}"
	enewuser "${USER_ID}" -1 -1 -1 "${GROUP_ID}"
}

src_unpack() {
	unpack ${A}
	unpack ${WORKDIR}/opengrok-${MY_PV}.tar.gz
	mv "${WORKDIR}"/"opengrok-${MY_PV}" ${P}
}

src_prepare() {
	epatch "${FILESDIR}/opengrok.1.patch"
	# sed script from Fedora opengrok.spec by Lubomir Kundrak
	sed 's,^<!DOCTYPE.*,<!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "docbookx.dtd">,
		 s,^<?Pub Inc>,,' man/man1/opengrok.1 | \
		xsltproc /usr/share/sgml/docbook/xsl-stylesheets/manpages/docbook.xsl -
	eapply_user
}

src_install() {
	doman opengrok.1

	if use doc ; then
		dodoc -r doc
	fi

	dodir "${INSTALL_DIR}"
	cp -pRP bin lib "${ED}/${INSTALL_DIR}" || die

	dodir "${SRC_DIR}"
	fowners "${USER_ID}:${GROUP_ID}" "${SRC_DIR}" -R
	fperms 775 "${SRC_DIR}"
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
	elog "e.g. ${INSTALL_DIR}/bin/OpenGrok index ${SRC_DIR}"
	elog ""
	elog "Browse to: http://YOUR_WEBAPP_SERVER:WEBAPPSRV_PORT/source"
	elog "e.g. http://localhost:8080/source/"
	elog ""
	elog "Restart tomcat if you get an application not-found on first installation:"
	elog "e.g. /etc/init.d/tomcat-8 restart"
}
