# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{10,11})

inherit distutils-r1

MY_PN=""

DESCRIPTION="Datetime type support for click"
HOMEPAGE="https://github.com/click-contrib/click-datetime"
SRC_URI="https://github.com/click-contrib/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	dev-python/click[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.md"

src_prepare() {
	sed -i -e 's;description-file;description_file;' "setup.cfg"
	eapply_user
}
