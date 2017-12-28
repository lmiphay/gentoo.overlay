# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7 python3_{4,5,6})

inherit distutils-r1

MY_PN="pyHS100"

DESCRIPTION="Interface for TPLink's smart devices (HSxxx plugs & LBxxx bulbs)"
HOMEPAGE="https://github.com/GadgetReactor/pyHS100"
SRC_URI="https://github.com/GadgetReactor/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/click-datetime[${PYTHON_USEDEP}]
	dev-python/typing[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.md"
S="${WORKDIR}/${MY_PN}-${PV}"
