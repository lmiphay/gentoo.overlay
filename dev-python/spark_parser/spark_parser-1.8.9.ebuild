# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_11)

inherit distutils-r1

DESCRIPTION="An Early-Algorithm Context-free grammar Parser"
HOMEPAGE="https://github.com/rocky/python-spark"
SRC_URI="https://github.com/rocky/python-spark/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
# https://github.com/rocky/python-spark/archive/1.8.9.tar.gz

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst NEW-FEATURES.rst"

S="${WORKDIR}/python-spark-${PV}"

distutils_enable_tests nose
