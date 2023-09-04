# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_11)

inherit distutils-r1

DESCRIPTION="Python API client for the Atlassian Stash REST API"
HOMEPAGE="http://github.com/RisingOak/stashy"
SRC_URI="https://github.com/cosmin/stashy/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	test? ( dev-python/mock )
	>=dev-python/decorator-3.4.0
	>=dev-python/requests-2.5.1
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"

src_install() {
	dodoc ${DOCS}
	distutils-r1_src_install
}
