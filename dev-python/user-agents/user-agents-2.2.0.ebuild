# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_11)

inherit distutils-r1 pypi

DESCRIPTION="Library to identify devices and capabilities by parsing user agent strings"
HOMEPAGE="https://github.com/selwin/python-user-agents"
SRC_URI="https://github.com/selwin/python-user-agents/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/ua-parser-0.4.1[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"
