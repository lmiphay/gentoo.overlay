# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_9)

inherit distutils-r1

DESCRIPTION="Reliable machine-readable Linux distribution information for Python"
HOMEPAGE="http://distro.readthedocs.io/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="test" # incomplete test resources

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"

DOCS="README.md docs/index.rst"

python_test() {
		py.test || die
}
