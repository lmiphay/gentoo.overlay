# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python{2_7,3_4,3_5,3_6})

inherit eutils distutils-r1

DESCRIPTION="Render Eliot logs as an ASCII tree"
HOMEPAGE="https://github.com/jonathanj/eliottree"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/six-1.9.0
	>=dev-python/toolz-0.8.2
	>=dev-python/termcolor-1.1.0
	>=dev-python/jmespath-0.7.1
	>=dev-python/iso8601-0.1.10
	>=dev-python/eliot-0.12.0
	>=dev-python/tree-format-0.1.1
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		>=dev-python/testtools-1.8.0
		>=dev-python/pytest-2.7.1
	)
	${RDEPEND}
"
