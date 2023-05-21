# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{10,11})

inherit eutils distutils-r1

DESCRIPTION="Calculations for the position of the sun and moon"
HOMEPAGE=""
SRC_URI="https://github.com/sffjunkie/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"

src_prepare() {
	sed -i -e 's;version=versioneer.get_version();version="1.5";' "setup.py"
	sed -i -e 's;versioneer.get_cmdclass();{};' "setup.py"

	eapply_user
}
