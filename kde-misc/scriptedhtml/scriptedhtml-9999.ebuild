# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit kde4-base git-r3

DESCRIPTION="KDE plasmoid to display the output of script or URL"
HOMEPAGE="http://kde-look.org/content/show.php?content=102052"
EGIT_REPO_URI="https://github.com/lmiphay/pdamsten-plasmoids.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	$(add_kdebase_dep plasma-workspace)
"
RDEPEND="${DEPEND}
"

src_prepare() {
	cp -p ${FILESDIR}/CMakeLists.txt ${S}
	kde4-base_src_prepare
}
