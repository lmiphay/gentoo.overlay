# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="A synthetic load generator"
HOMEPAGE="https://www.devin.com/lookbusy/"
SRC_URI="https://devin.com/lookbusy/download/${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
"
DEPEND="${RDEPEND}
"

DOCS="AUTHORS BUGS ChangeLog README"
