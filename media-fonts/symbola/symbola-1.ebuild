# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Multilingual support and Symbol blocks of The Unicode Standard"
HOMEPAGE="https://dn-works.com/ufas/"
SRC_URI="https://dn-works.com/wp-content/uploads/2020/UFAS-Fonts/Symbola.zip"
LICENSE="UFAS"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc x86 ~x86-fbsd"

FONT_PN="symbola"
FONT_SUFFIX="ttf"

S=${WORKDIR}

src_prepare()
{
	mv Symbola.otf symbola.ttf || die
	default
}
