# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit readme.gentoo-r1 eutils user versionator

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
KEYWORDS="~amd64 ~x86"
IUSE="+doc subversion"

RDEPEND="
	>=dev-util/ctags-20170704
	>=www-servers/tomcat-8.0.39
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

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
To create a tomcat instance to host opengrok, see: https://wiki.gentoo.org/wiki/Apache_Tomcat ; e.g.

   /usr/share/tomcat-8/gentoo/tomcat-instance-manager.bash --create

To deploy the web app see: https://github.com/OpenGrok/OpenGrok/wiki/How-to-install-OpenGrok ; e.g.

   OPENGROK_TOMCAT_BASE=/var/lib/tomcat-8 opengrok deploy

To index the source directory (${SRC_DIR}):

  opengrok index <absolute_path_to_your_SRC_ROOT>

e.g.

  opengrok index ${SRC_DIR}

Browse to: http://YOUR_WEBAPP_SERVER:WEBAPPSRV_PORT/source ; e.g.

  http://localhost:8080/source/

Restart tomcat, e.g.

  /etc/init.d/tomcat-8 restart

This is an RC release! Check the release notes at: https://github.com/OpenGrok/OpenGrok/releases
You probably want to reindex; e.g.

  opengrok index ${SRC_DIR}
"

pkg_setup() {
	enewgroup "${GROUP_ID}"
	enewuser "${USER_ID}" -1 -1 -1 "${GROUP_ID}"
}

src_prepare() {
	epatch "${FILESDIR}/${MY_PN}-${PV}.patch"
	# sed script from Fedora opengrok.spec by Lubomir Kundrak
	sed 's,^<!DOCTYPE.*,<!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "docbookx.dtd">,
		 s,^<?Pub Inc>,,' man/man1/opengrok.1 | \
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

	make_wrapper "${MY_PN}" ./OpenGrok ${INSTALL_DIR}/bin

	# install default logging.properties file (required by driver script)
	insinto "${INSTALL_DIR}/doc"
	doins doc/logging.properties

	dodir "${ETC_DIR}" "${SRC_DIR}"
	fowners "${USER_ID}:${GROUP_ID}" "${OPENGROK_DIR}" -R
	fperms 775 "${OPENGROK_DIR}"

	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
