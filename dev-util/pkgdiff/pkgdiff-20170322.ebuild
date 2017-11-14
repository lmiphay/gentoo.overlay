# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A tool for visualizing changes in Linux software packages"
HOMEPAGE="https://lvc.github.io/pkgdiff/"
EGIT_REPO_URI="https://github.com/lvc/pkgdiff.git"
EGIT_COMMIT="71c375e6548e36c63b2bc3859f7ae7ce47dde2c3"

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
	mkdir -p "${ED}/usr"
	PATH="${PATH}:${ED}usr/bin" perl Makefile.pl -install -prefix "${ED}usr" || die

	dodoc README doc/index.html
}
