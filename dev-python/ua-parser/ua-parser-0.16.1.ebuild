# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_11)

inherit distutils-r1 pypi

DESCRIPTION="Python port of Browserscope's user agent parser"
HOMEPAGE="https://github.com/ua-parser/uap-python"
SRC_URI="https://github.com/ua-parser/uap-python/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	>=dev-python/pyyaml-3.12[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"
