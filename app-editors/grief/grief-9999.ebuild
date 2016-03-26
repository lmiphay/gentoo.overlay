# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils git-r3

DESCRIPTION="Programmers console editor/a BRIEF clone"
HOMEPAGE="https://sourceforge.net/projects/grief/"
EGIT_REPO_URI="git://git.code.sf.net/p/grief/code"
SRC_URI="grief-libchartable-1.0.tar.xz"

LICENSE="QPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="fetch"

DEPEND="
	app-arch/unzip
	dev-lang/perl
	sys-libs/binutils-libs
"
RDEPEND="${DEPEND}"

pkg_nofetch() {
	einfo "Please generate libchartable data"
	einfo "using ${FILESDIR}/generate-libchartable.sh"
	einfo "and move the resulting tarball into ${DISTDIR}"
}

src_prepare() {
	(cd "${S}"/libchartable && unpack ${A})
	epatch "${FILESDIR}"/bfd_config.patch
	epatch "${FILESDIR}"/clocks_per_second.patch
	epatch "${FILESDIR}"/disable-hlpdoc.patch
	epatch_user
}

src_configure() {
	# this needs work:
	# with ED grief looks in the wrong places for macros (and installs to /usr/share/macros instead of /usr/share/grief/macros)
	# without it, there are sandbox violations
	./configure_new --prefix=${ED}/usr
}

src_compile() {
	emake -j1
}

pkg_postinst() {
	elog "For the moment documentation is online only at: http://grief.sourceforge.net/"
	elog "export GRPATH=/usr/share/macros to allow grief startup"
}
