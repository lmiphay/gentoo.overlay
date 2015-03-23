# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils bash-completion-r1 git-r3

DESCRIPTION="command-line control of squeezebox network players via squeezeserver"
HOMEPAGE="https://github.com/pssc/squeezy"
EGIT_REPO_URI="https://github.com/pssc/squeezy.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}
	dev-perl/JSON-RPC
"

src_install() {
	dobin squeezy
	dodoc squeezy.README.txt squeezy.HELP.txt
	newdoc squeezy.conf squeezy.conf.example
	newbashcomp _squeezy.bash ${PN}
	insinto /usr/share/zsh/site-functions
	doins _squeezy
	insinto /etc
	newins squeezy.conf squeezy.conf.example
}

pkg_postinst() {
	elog "Support thread at: http://forums.slimdevices.com/showthread.php?87636-squeezy-a-command-line-wrapper-around-the-squeezeserver-telnet-CLI"
}
