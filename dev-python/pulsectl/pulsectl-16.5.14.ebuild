# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_9)

inherit distutils-r1

DESCRIPTION="igh-level interface and ctypes-based bindings for PulseAudio"
HOMEPAGE="https://github.com/mk-fg/python-pulse-control"
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

DOCS="README.rst"
