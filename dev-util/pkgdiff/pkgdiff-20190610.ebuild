# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A tool for visualizing changes in Linux software packages"
HOMEPAGE="https://lvc.github.io/pkgdiff/"
EGIT_REPO_URI="https://github.com/lvc/pkgdiff.git"
EGIT_COMMIT="114b96f5e488425ecb3b4f4d27128fdbbe37c5fa"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	sys-apps/diffutils
	app-text/wdiff
	sys-apps/gawk
	sys-devel/binutils
"
DEPEND="
	${RDEPEND}
	dev-lang/perl
	dev-perl/File-LibMagic
	dev-perl/Module-Build
"

src_compile() {
	true
}

src_install() {
	mkdir -p "${D}/usr"
	perl Makefile.pl -install -prefix "${D}/usr"

	dodoc README.md doc/index.html
	newbin pkgdiff.pl pkgdiff
}
