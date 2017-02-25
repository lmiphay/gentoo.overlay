# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=(python2_7 python3_4)

inherit eutils distutils-r1

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
	dev-python/nose
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six
	${RDEPEND}
"
