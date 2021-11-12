# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_9)
DISTUTILS_USE_SETUPTOOLS=no

inherit eutils distutils-r1 git-r3

DESCRIPTION="Logitech Media Server/Squeezebox API for Python"
HOMEPAGE="https://github.com/jinglemansweep/PyLMS"
EGIT_REPO_URI="https://github.com/jinglemansweep/PyLMS.git"
EGIT_COMMIT="47694c67cb4971beb6896b804847f1f49ed79e26"

LICENSE="GPL-2+"
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

DOCS="README.md docs/source"

python_install() {
	dodoc -r ${DOCS}
	distutils-r1_python_install
}
