# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

DESCRIPTION="ShairPort Squeezebox Server Plugin - airTunes for Squeezebox clients"
HOMEPAGE="https://github.com/StuartUSA/shairport_plugin/"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://github.com/StuartUSA/shairport_plugin.git"
	inherit git-r3
else
	SRC_URI="https://github.com/StuartUSA/shairport_plugin/archive/master.zip"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-perl/Crypt-OpenSSL-RSA
	dev-perl/IO-Socket-INET6
	dev-perl/Net-SDP
	media-sound/logitechmediaserver-bin
	media-sound/shairport_helper
	net-dns/avahi
	virtual/perl-Digest-MD5
	virtual/perl-MIME-Base64
"

RDEPEND="${DEPEND}"

# or /opt/logitechmediaserver/Plugins
INSTALL_DIR="/var/lib/logitechmediaserver/Plugins/ShairTunes"

src_prepare() {
	epatch_user
}

src_install() {
	insinto ${INSTALL_DIR}
	doins AIRPLAY.pm Plugin.pm install.xml public.xml strings.txt
	fowners logitechmediaserver:logitechmediaserver ${INSTALL_DIR} -R
	dodoc README.md
}

pkg_postinst() {
	elog "ShairTunes plugin installed to ${INSTALL_DIR} - now restart avahi-daemon, logitechmediaserver"
}
