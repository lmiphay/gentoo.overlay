# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_11)

inherit eutils distutils-r1

DESCRIPTION="A semi hard Cornish cheese, also queries PyPI"
HOMEPAGE="https://github.com/kura/yarg"
SRC_URI="https://github.com/kura/yarg/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"

src_prepare() {
	# fixme: package tries to install 'tests' package 'which is forbidden'
	rm -rf tests
	eapply_user
}
