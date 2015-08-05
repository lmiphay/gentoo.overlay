# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/robinbowes/net-udap.git"
inherit perl-module git-r3

DESCRIPTION="A Perl module to configure the Logitech SqueezeBox Receiver"
HOMEPAGE="https://github.com/robinbowes/net-udap"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="
	${RDEPEND}
	dev-perl/Class-Accessor
	dev-perl/IO-Interface
	dev-perl/Log-StdLog
	dev-perl/Term-Shell
	dev-perl/Module-Build
"

SRC_TEST="skip"

S=${WORKDIR}/${P}/src/${PN}

src_prepare() {
	sed -i -e 's:use lib:#use lib:' "${WORKDIR}/${P}/scripts/udap_shell.pl"
	sed -i '/Message.pm/d' "${WORKDIR}/${P}/src/Net-UDAP/MANIFEST"
	touch "${WORKDIR}/${P}/src/Net-UDAP/META.yml"
	perl-module_src_prepare
}

src_install() {
	perl-module_src_install

	dodoc $WORKDIR/$P/README.md
	dodoc -r $WORKDIR/$P/doc
	dobin $WORKDIR/$P/scripts/udap_shell.pl
}

pkg_postinst() {
	elog "udap_shell.pl has been installed into /usr/bin"
	elog ""
	elog "Net-UDAP documentation is online at:"
	elog ""
	elog "1. http://projects.robinbowes.com/Net-UDAP/trac/wiki/GettingStarted"
	elog "2. http://projects.robinbowes.com/Net-UDAP/trac/wiki/ReceiverSetupProcedure"
	elog "3. http://projects.robinbowes.com/Net-UDAP/trac/wiki/SampleUsage"
	elog ""
	elog "Support thread at: http://forums.slimdevices.com/showthread.php?57861-Net-UDAP-SqueezeBox-Receiver-configuration-tool"
}
