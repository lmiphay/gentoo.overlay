# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit eutils

DESCRIPTION="A tee command that posts to Slack instead of writing to file"
HOMEPAGE="https://github.com/course-hero/slacktee"
SRC_URI="https://github.com/course-hero/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	net-misc/curl
"

src_install() {
	dobin slacktee.sh
	insinto /etc
	doins slacktee.conf
	dodoc README.md
}

pkg_postinst() {
	elog "An empty global configuration file has been installed as: /etc/slacktee.conf"
	elog ""
	elog "To make a local ${PN} configuration (creates: ~/.slacktee)"
	elog "in interactive mode, now run:"
	elog "${PN} --setup"
}
