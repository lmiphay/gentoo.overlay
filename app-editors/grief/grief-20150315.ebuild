# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit git-r3

DESCRIPTION="Programmers console editor/a BRIEF clone"
HOMEPAGE="https://sourceforge.net/projects/grief/"
EGIT_REPO_URI="https://git.code.sf.net/p/grief/code"
EGIT_COMMIT="5653b574c4747ea9acda4021b14a691ac41f9580"
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

PATCHES=( \
	"${FILESDIR}"/bfd_config.patch \
	"${FILESDIR}"/clocks_per_second.patch \
	"${FILESDIR}"/disable-hlpdoc.patch \
	"${FILESDIR}"/define-cbegin-decls.patch
)

pkg_nofetch() {
	einfo "Please generate libchartable data"
	einfo "using ${FILESDIR}/generate-libchartable.sh"
	einfo "and move the resulting tarball into ${DISTDIR}"
}

src_prepare() {
	(cd "${S}"/libchartable && unpack ${A})
	default
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
