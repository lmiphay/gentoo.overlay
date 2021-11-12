# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Microsoft's Tahoma font"
HOMEPAGE="http://microsoft.com"
SRC_URI="file:///tahoma.ttf file:///tahomabd.ttf"
LICENSE="MSttfEULA"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc x86 ~x86-fbsd"
RESTRICT="bindist fetch"

S=${WORKDIR}
FONT_S=${WORKDIR}
FONT_SUFFIX="ttf"
FONTDIR="/usr/share/fonts/tahoma"
MYDISTDIR="/usr/portage/distfiles"

pkg_nofetch() {
	einfo ""
	einfo "Please copy these files to your distfiles directory:"
	einfo "tahoma.ttf"
	einfo "tahomabd.ttf"
}

src_unpack() {
	cp ${MYDISTDIR}/tahoma.ttf ${MYDISTDIR}/tahomabd.ttf ${S}
}
