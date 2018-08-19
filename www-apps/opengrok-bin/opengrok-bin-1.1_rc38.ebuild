# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils user versionator

MY_PN="${PN/-bin/}"
# 1.1_rc2 -> 1.1-rc2
MY_PV=$(replace_version_separator 2 '-')
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="Fast source code search and cross reference engine"
HOMEPAGE="http://opengrok.github.io/OpenGrok/"
SRC_URI="https://github.com/OpenGrok/OpenGrok/releases/download/${MY_PV}/${MY_P}.tar.gz"
RESTRICT="mirror"

LICENSE="CDDL"
SLOT="0"
KEYWORDS=""
# use cssc for SCCS support
IUSE="cssc +doc subversion"

TOMCAT=9

RDEPEND="
	>=dev-util/ctags-5.8
	www-servers/tomcat:${TOMCAT}
	cssc? ( dev-vcs/cssc )
	subversion? ( >=dev-vcs/subversion-1.9.5[java] )
"
DEPEND="
	${RDEPEND}
	app-text/docbook-xsl-stylesheets
	dev-libs/libxslt
"

INSTALL_DIR="/opt/${MY_PN}"
OPENGROK_DIR="/var/${MY_PN}"
ETC_DIR="${OPENGROK_DIR}/etc"
SRC_DIR="${OPENGROK_DIR}/src"
USER_ID="opengrok"
GROUP_ID="opengrok"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	enewgroup "${GROUP_ID}"
	enewuser "${USER_ID}" -1 -1 -1 "${GROUP_ID}"
}

src_prepare() {
	# force the finding of ctags (exuberant version is installed as ctags on gentoo)
	sed -i -e "s:'ctags-exuberant', 'exctags', ::" bin/indexer.py

	# manpage sed based on Fedora opengrok.spec by Lubomir Kundrak
	sed 's,^<!DOCTYPE.*,<!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "docbookx.dtd">,
		 s,^<?Pub Inc>,,
		 s,^<command>opengrok,<command>opengrok</command>,
		 s,^<optional><option>,<arg><option>,
		 s,</option></optional>,</option></arg>,
		 s,^</command>,,' man/man1/opengrok.1 | \
		xsltproc /usr/share/sgml/docbook/xsl-stylesheets/manpages/docbook.xsl -
	eapply_user
}

src_install() {
	doman opengrok.1

	if use doc ; then
		dodoc -r doc/*
	fi

	dodir "${INSTALL_DIR}"
	cp -pRP bin lib "${ED}/${INSTALL_DIR}" || die

	# install default logging.properties file (required by driver script)
	insinto "${INSTALL_DIR}/doc"
	doins doc/logging.properties

	dodir "${ETC_DIR}" "${SRC_DIR}"
	keepdir "${ETC_DIR}" "${SRC_DIR}"
	fowners "${USER_ID}:${GROUP_ID}" "${OPENGROK_DIR}" -R
	fperms 775 "${OPENGROK_DIR}"
}

pkg_postinst() {
	elog "Create a tomcat instance to host opengrok, see: https://wiki.gentoo.org/wiki/Apache_Tomcat"
	elog "e.g. /usr/share/tomcat-${TOMCAT}/gentoo/tomcat-instance-manager.bash --create"
	elog ""
	elog "Deploy the web app, example:"
	elog "   ${INSTALL_DIR}/bin/deploy.py ${INSTALL_DIR}/lib/source.war /var/lib/tomcat-${TOMCAT}/webapps"
	elog ""
	elog "Index the source directory (${SRC_DIR}), example:"
	elog "   ${INSTALL_DIR}/bin/indexer.py -j /usr/bin/java -a ${INSTALL_DIR}/lib/opengrok.jar -- \ "
	elog "       --source ${SRC_DIR} --dataRoot ${OPENGROK_DIR}/data --host http://127.0.0.1:8080/source"
	elog ""
	elog "If you need to specify JAVA_HOME: export JAVA_HOME=\$(java-config-2 --jdk-home)"
	elog ""
	elog "Browse to: http://YOUR_WEBAPP_SERVER:WEBAPPSRV_PORT/source"
	elog "e.g. http://localhost:8080/source/"
	elog ""
	elog "Restart tomcat if you get an application not-found on first installation:"
	elog "e.g. /etc/init.d/tomcat-${TOMCAT} restart"
	elog ""
	elog "Release notes at: https://github.com/OpenGrok/OpenGrok/releases"
}
