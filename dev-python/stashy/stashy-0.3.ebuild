# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7 python3_4)

inherit eutils distutils-r1

DESCRIPTION="Python API client for the Atlassian Stash REST API"
HOMEPAGE="http://github.com/RisingOak/stashy"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

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
