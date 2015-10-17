# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python{2_7,3_{3,4}})

inherit eutils distutils-r1 git-r3

DESCRIPTION="UI to track merges on gentoo servers"
HOMEPAGE="https://github.com/lmiphay/gentoo-koam"
EGIT_REPO_URI="https://github.com/lmiphay/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="kde"

RDEPEND="
	app-portage/gentoo-oam
	dev-python/PyQt4
	kde? ( dev-util/plasmate kde-base/plasma-workspace[python] kde-base/pykde4 )
"
DEPEND="${RDEPEND}
"

DOCS="README.md"
