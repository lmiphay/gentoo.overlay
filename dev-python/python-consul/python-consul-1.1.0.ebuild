# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12..13})

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python client for Consul (http://www.consul.io/)"
HOMEPAGE="https://github.com/cablehead/python-consul"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst CHANGELOG.rst"
