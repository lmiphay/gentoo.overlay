# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{11..13})

inherit distutils-r1 pypi

DESCRIPTION="Lightweight Python module to discover and control WeMo devices"
HOMEPAGE="https://github.com/pavoni/pywemo"
SRC_URI="$(pypi_sdist_url pywemo)"
RESTRICT="mirror"

LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/ifaddr[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"
