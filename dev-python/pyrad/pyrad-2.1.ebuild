# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7 python3_6)

inherit eutils distutils-r1

DESCRIPTION="Python RADIUS implementation"
HOMEPAGE="https://github.com/wichert/pyrad"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/netaddr
	dev-python/six
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"

src_install() {
	dodoc ${DOCS}
	distutils-r1_src_install
}
