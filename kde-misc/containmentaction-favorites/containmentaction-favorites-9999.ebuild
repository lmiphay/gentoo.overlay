# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit kde4-base git-r3

DESCRIPTION="KDE Favorites Launcher"
HOMEPAGE="http://kde-apps.org/content/show.php/Favorites+Launcher?content=117639"
EGIT_REPO_URI="git://anongit.kde.org/scratch/cfeck/containmentaction-favorites.git"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	$(add_kdebase_dep plasma-workspace)
"
DEPEND="${RDEPEND}
"

src_install() {
	dodoc HOWTO
	kde4-base_src_install
}

pkg_postinst() {
	elog "To enable this launcher see: /usr/share/doc/${P}"
}
