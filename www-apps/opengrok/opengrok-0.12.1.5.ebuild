# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils user

DESCRIPTION="Fast source code search and cross reference engine"
HOMEPAGE="http://opengrok.github.io/OpenGrok/"
SRC_URI="https://github.com/OpenGrok/OpenGrok/archive/${PV}.tar.gz -> ${PN}.tar.gz"
RESTRICT="mirror"

LICENSE="CDDL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="
	>=dev-java/jflex-1.6.1
	>=dev-util/ctags-5.8
	>=virtual/jdk-1.8
	>=www-servers/tomcat-8.0.32-r1
"
DEPEND="
	${RDEPEND}
	>=dev-java/ant-1.9.2
"

INSTALL_DIR="/usr/share/opengrok"
SRC_DIR="/var/opengrok/src"
USER_ID="opengrok"
GROUP_ID="opengrok"

S="${WORKDIR}/OpenGrok-${PV}"

src_compile() {
	# Todo:
	#   1. eant / java-pkg_jar-from
	#   2. JFlex.present, lucene-core.jar.present
	# build currently downloads (download-jflex, download-lucene):
	#  http://repo1.maven.org/maven2/de/jflex/jflex/1.5.1/jflex-1.5.1.jar
	#  http://repo1.maven.org/maven2/org/apache/lucene/lucene-core/4.7.1/lucene-core-4.7.1.jar
	#  http://repo1.maven.org/maven2/org/apache/lucene/lucene-analyzers-common/4.7.1/lucene-analyzers-common-4.7.1.jar
	#  http://repo1.maven.org/maven2/org/apache/lucene/lucene-queryparser/4.7.1/lucene-queryparser-4.7.1.jar
	#  http://repo1.maven.org/maven2/org/apache/lucene/lucene-suggest/4.7.1/lucene-suggest-4.7.1.jar
	ant -lib /usr/share/jflex/lib
}

src_install() {
	sed -i '2iOPENGROK_DISTRIBUTION_BASE=/usr/share/opengrok' OpenGrok
	dobin OpenGrok

	dodoc dist/opengrok.1 CHANGES.txt doc/EXAMPLE.txt NOTICE.txt README.txt logging.properties paths.tsv
	rm dist/opengrok.1 # SolBook xml doc

	dodir "${INSTALL_DIR}/lib"
	cp -pRP dist/* "${ED}/${INSTALL_DIR}/lib" || die

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
	elog "e.g. OPENGROK_TOMCAT_BASE=/var/lib/tomcat-8 OpenGrok deploy"
	elog ""
	elog "To index the source directory: OpenGrok index <absolute_path_to_your_SRC_ROOT>"
	elog "e.g.  OpenGrok index ${SRC_DIR}"
	elog ""
	elog "Browse to: http://YOUR_WEBAPP_SERVER:WEBAPPSRV_PORT/source"
	elog "e.g. http://localhost:8080/source/"
}
