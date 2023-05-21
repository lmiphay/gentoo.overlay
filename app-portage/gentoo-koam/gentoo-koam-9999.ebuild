# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{10,11})

inherit eutils distutils-r1 git-r3

DESCRIPTION="UI to track merges on gentoo servers"
HOMEPAGE="https://github.com/lmiphay/gentoo-koam"
EGIT_REPO_URI="https://github.com/lmiphay/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="kde"

#	plasmoidviewer? ( dev-util/plasmate )
RDEPEND="
	app-portage/gentoo-oam
	dev-python/PyQt4
	dev-python/pyyaml
	kde? ( kde-base/plasma-workspace[python] kde-base/pykde4 )
	virtual/ssh
"
DEPEND="${RDEPEND}
"

DOCS="README.md"
