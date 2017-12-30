# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7 python3_{4,5,6})

inherit distutils-r1

DESCRIPTION="Tools to implement Secure Remote Password (SRP) authentication"
HOMEPAGE="https://github.com/idlesign/srptools"
SRC_URI="https://github.com/idlesign/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="BSD-with-attribution"  # closest
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"
