# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{11..13})

inherit distutils-r1 pypi

DESCRIPTION="A framework for building packages and for managing the dependencies"
HOMEPAGE="https://github.com/secondlife/autobuild"
#SRC_URI="https://github.com/secondlife/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="$(pypi_sdist_url "${PN}" "${PV}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/pydot[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	games-simulation/llbase[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.md"

EXCLUDE_TESTS='
[options.packages.find]
exclude =
	tests
	tests.*
'

src_prepare() {
	sed -i -e "s:'tests':'test', 'tests.*':" setup.py
	echo "$EXCLUDE_TESTS" >> setup.cfg
	eapply_user
}
