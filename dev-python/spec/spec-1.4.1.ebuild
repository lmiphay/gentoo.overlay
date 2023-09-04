# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_11)

inherit distutils-r1

DESCRIPTION="Specification-style nosetests output for Python"
HOMEPAGE="https://github.com/bitprophet/spec"
SRC_URI="https://github.com/bitprophet/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/nose[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	${RDEPEND}
"
