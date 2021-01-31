# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_9)

inherit distutils-r1

DESCRIPTION="An embeddable and extensible query language"
HOMEPAGE="https://launchpad.net/yaql"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/Babel-1.3.0
	<dev-python/pbr-2.0.0
	>=dev-python/python-dateutil-2.4.2
	>=dev-python/six-1.9.0
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"
