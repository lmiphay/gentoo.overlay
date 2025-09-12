# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12..13} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="List processing tools and functional utilities"
HOMEPAGE="https://github.com/pytoolz/toolz/"
SRC_URI="https://github.com/pytoolz/toolz/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
