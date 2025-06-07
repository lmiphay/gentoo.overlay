# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_12)

inherit distutils-r1

DESCRIPTION="Generate pip requirements.txt file based on imports of any project"
HOMEPAGE="https://github.com/bndr/pipreqs"
SRC_URI="https://github.com/bndr/pipreqs/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]
	dev-python/yarg[${PYTHON_USEDEP}]
	${RDEPEND}
"

distutils_enable_tests unittest

DOCS="README.rst"

# the tests fail connecting out to pypi.python.org
RESTRICT="test"
